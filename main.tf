provider "aws" {
  region = var.aws_region
}

resource "aws_key_pair" "kops_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_security_group" "kops_sg" {
  name        = "kops-admin-sg"
  description = "Allow SSH and internet access"

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "kops_admin" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.kops_key.key_name
  vpc_security_group_ids      = [aws_security_group.kops_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "kops-ansible-admin"
  }
}
