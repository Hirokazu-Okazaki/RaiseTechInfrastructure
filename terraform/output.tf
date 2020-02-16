output "ec2_public_dns" {
  value = aws_instance.app_1a.*.public_dns
}

output "ec2_public_ip" {
  value = aws_instance.app_1a.*.public_ip
}