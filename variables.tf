variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

variable "instance_type" {
  type    = string
  default = "t3.micro" # Zmena oproti zadani kvuli regionu
}

variable "ami_id" {
  type = string
}

variable "key_name" {
  type    = string
  default = "terraform-key"
}

variable "public_key_path" {
  type    = string
  default = "~/.ssh/id_rsa.pub"
}