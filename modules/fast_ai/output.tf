output "ami" {
  value = "${data.aws_ami.fast_ai.image_id}"
}

output "user_data" {
  value = "${data.template_file.bootstrap.rendered}"
}
