variable "aws_region" {
  default = "us-east-2"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu 22.04 in your region"
}

variable "instance_type" {
  default = "t2.medium"
}

variable "key_name" {
  description = "Name of an existing EC2 key pair in AWS"
}

