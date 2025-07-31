provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "homework-4" {
  ami           = var.ami_id
  instance_type = var.instance_type
  monitoring    = true

  tags = {
    Name = "terraform-ec2-homework-4"
  }
}
