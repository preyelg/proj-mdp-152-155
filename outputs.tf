output "instance_ips" {
  value = aws_instance.k8s[*].public_ip
}
