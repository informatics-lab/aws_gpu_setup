data "template_file" "bootstrap" {
  template = "${file("${path.module}/files/bootstrap.yml")}"
}

data "aws_ami" "fast_ai" {
  most_recent = true
  filter {
    name = "name"
    values = ["fastai-dl-01"]
  }

  owners = ["191578494129"]
}
