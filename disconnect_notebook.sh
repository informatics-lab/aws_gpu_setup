set -e # exit on command fail
set -u # exit on unset variable

pid=`cat /tmp/autossh.pid`
kill $pid
