output "instance_public_ip" {
  value = aws_instance.kops_admin.public_ip
}

output "instance_id" {
  value = aws_instance.kops_admin.id
}
