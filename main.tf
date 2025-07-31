provider "aws" {
  region = var.aws_region
}

resource "aws_instance" "homework-4" {
  ami           = var.ami_id
  instance_type = var.instance_type
  monitoring    = true

  key_name = aws_key_pair.ssh_key.key_name
  security_groups = [aws_security_group.ssh.name]

  tags = {
    Name = "terraform-ec2-homework-4",
    Name = "has-ssh-access"
  }
}

resource "aws_key_pair" "ssh_key" {
  key_name = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "ssh" {
  name   = "terraform-ssh-sg"
  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "terraform-ssh-sg"
  }
}

data "aws_vpc" "default" {
  default = true
}