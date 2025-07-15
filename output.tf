output "dev-instance-public-ip-address" {
  value = aws_instance.dev-instance[*].public_ip
}

output "dev-instance-private-ip-address" {
  value = aws_instance.dev-instance[*].private_ip
}