output "SecurityGroup" {
  value = aws_security_group.web_app_alb-sg.id
}

output "ALB-ID" {
  value = aws_lb.web_app-alb.id
}

output "ALB-DNS-Name" {
  value = aws_lb.web_app-alb.dns_name
}