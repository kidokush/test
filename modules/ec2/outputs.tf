output "public_ip" {
  value = aws_instance.kido.public_ip
}

output "instance_id" {
  value = aws_instance.kido.id
}
