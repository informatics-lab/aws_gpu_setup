module "aws_dl" {
  source = "../modules/aws_dl"
}

module "gpu_instance" {
  source = "../modules/gpu_instance"
  allowed_cidr = "${var.allowed_cidr}"
  ami = "${module.aws_dl.ami}"
  user_data = "${module.aws_dl.user_data}"
}

output "public_ip" {
  value = "${module.gpu_instance.public_ip}"
}

output "private_ip" {
  value = "${module.gpu_instance.private_ip}"
}

output "bastion_host" {
  value = "${var.bastion_host}"
}
