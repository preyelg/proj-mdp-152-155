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
  description = "Name for the key pair"
}

variable "public_key_path" {
  description = "Path to your SSH public key file"
}
