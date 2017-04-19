module "fast_ai" {
  source = "../modules/fast_ai"
}

module "gpu_instance" {
  source = "../modules/gpu_instance"
  allowed_cidr = "${var.allowed_cidr}"
  ami = "${module.fast_ai.ami}"
  user_data = "${module.fast_ai.user_data}"
}

output "public_ip" {
  value = "${module.gpu_instance.public_ip}"
}

output "private_ip" {
  value = "${module.gpu_instance.private_ip}"
}

