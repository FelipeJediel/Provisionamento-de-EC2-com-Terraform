output "instance_public_ip" {
  value       = aws_instance.web_server.public_ip
  description = "IP público da instância EC2"
}
