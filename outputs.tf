output "instance_public_ip" {
  description = "IP Público da Instância EC2"
  value       = aws_instance.web.public_ip
}

output "instance_url" {
  description = "URL para acessar o Nginx"
  value       = "http://${aws_instance.web.public_ip}"
}
