data "template_file" "gpu_instance_bootstrap" {
  template = "${file("./bootstrap.yml")}"
}

resource "aws_security_group" "allow_8888" {
  name = "allow_internal_8888"
  description = "Allow ingress for Jupyter"
  ingress {
    from_port = "8888"
    to_port   = "8888"
    protocol  = "tcp"
    cidr_blocks = ["${var.allowed_cidr}"]
  }
}

resource "aws_instance" "gpu_instance" {
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "p2.xlarge"
  security_groups = ["default", "${aws_security_group.allow_8888.name}"]
  key_name = "gateway"
  user_data = "${data.template_file.gpu_instance_bootstrap.rendered}"
  tags {
    Name = "gpu_instance"
  }
}

output "public_ip" {
  value = "${aws_instance.gpu_instance.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.gpu_instance.private_ip}"
}

output "bastion_host" {
  value = "${var.bastion_host}"
}

