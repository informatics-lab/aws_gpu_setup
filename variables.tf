variable "region" {
  default = "eu-west-1"
}

variable "amis" {
  type = "map"
  default = {
    "eu-west-1" = "ami-b43d1ec7"
  }
}

variable "allowed_cidr" {}

variable "bastion_host" {}
