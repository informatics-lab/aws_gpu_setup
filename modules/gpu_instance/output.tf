output "public_ip" {
  value = "${aws_instance.gpu_instance.public_ip}"
}

output "private_ip" {
  value = "${aws_instance.gpu_instance.private_ip}"
}
