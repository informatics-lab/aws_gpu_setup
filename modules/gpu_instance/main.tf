resource "aws_security_group" "allow_8888" {
  name_prefix = "allow_8888_"
  description = "Managed by Terraform - allow ingress for Jupyter"
  ingress {
    from_port = "8888"
    to_port   = "8888"
    protocol  = "tcp"
    cidr_blocks = ["${var.allowed_cidr}"]
  }
}

resource "aws_instance" "gpu_instance" {
  ami = "${var.ami}"
  instance_type = "p2.xlarge"
  security_groups = ["default", "${aws_security_group.allow_8888.name}"]
  key_name = "gateway"
  user_data = "${var.user_data}"
  tags {
    Name = "gpu_instance"
  }
}

