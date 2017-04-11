# AWS GPU instance setup

This terraform script creates a p2.xlarge instance in AWS and allows you to connect to a Jupyter notebook running on the server. I've tried to make it generic but I've only tested on our own AWS setup so may need some tweaking. Improvements welcome :)

I used the details from fast.ai's [course](http://course.fast.ai/lessons/aws.html) and [github](https://github.com/fastai/courses/tree/master/setup)

You may need to contact Amazon to get authorisation to run p2 instances, see the fast.ai setup instructions for more details.

## Dependencies

- terraform
- autossh

These can be installed with brew on Mac

## Instructions

### With bastion host
1. Define variables in terraform.tfvars
  - bastion_host: host / ip of bastion host to jump through
  - allowed_cidr: cidr block of your vpc, e.g. 10.0.0.0/16 

2. Run terraform apply

3. Run ./connect_notebook.sh
  - The Notebook process can take quite a while to start, you may need to wait a minute
  - Default password is dl_course

### Without bastion host

(I haven't actually tested this but in theory...)

1. Define variables in terraform.tfvars
  - allowed_cidr: your public ip address, e.g. xxx.xxx.x.xx/32

2. Run terraform apply

3. Directly connect to <instance_public_ip>:8888
  - The Notebook process can take quite a while to start, you may need to wait a minute
  - Default password is dl_course

## Destroy
The p2.xlarge currently costs ~$1 per hour. 

1. terraform destroy
  - Answer yes / use --force flag
