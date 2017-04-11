set -e # exit on command fail
set -u # exit on unset variable

host=`terraform output private_ip`
bastion=`terraform output bastion_host`
user=ec2-user # should grab this from terraform too

pid_file=/tmp/autossh.pid

if [ -f $pid_file ]; then
    ./disconnect_notebook.sh
fi

AUTOSSH_PIDFILE=/tmp/autossh.pid autossh -M 0 -f -N -L 8889:$host:8888 $user@$bastion

echo 'default password is dl_course' 
echo 'created a background ssh process. Run ./disconnect_notebook.sh or pkill autossh to disconnect'

python -mwebbrowser http://0.0.0.0:8889
