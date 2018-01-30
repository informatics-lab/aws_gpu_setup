data "template_file" "bootstrap" {
  template = "${file("${path.module}/files/bootstrap.yml")}"
}

data "aws_ami" "aws_dl" {
  most_recent = true
  filter {
    name = "name"
    values = ["Deep Learning AMI (Ubuntu) Version 3.*"]
  }

  owners = ["898082745236"]
}
