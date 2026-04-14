# 1. O DNS do Load Balancer (Sua única porta de entrada real)
output "load_balancer_dns" {
  description = "Acesse a aplicação por aqui"
  value       = aws_lb.main.dns_name
}

# 2. O nome do Auto Scaling Group (Útil para comandos via CLI)
output "asg_name" {
  description = "Nome do grupo de auto scaling"
  value       = aws_autoscaling_group.app_asg.name
}
