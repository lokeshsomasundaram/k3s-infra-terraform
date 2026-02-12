variable "region" {
  default = "ap-southeast-1"
}

variable "instance_type" {
  default = "m7i-flex.large"
}

variable "key_name" {
  description = "singapore-keypair"
}

variable "security_group_id" {
  description = "sg-05d4f53a104659130"
}

variable "ami_id" {
  description = "ami-08d59269edddde222"
}
