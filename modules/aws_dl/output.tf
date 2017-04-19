output "ami" {
  value = "${data.aws_ami.aws_dl.image_id}"
}

output "user_data" {
  value = "${data.template_file.bootstrap.rendered}"
}
