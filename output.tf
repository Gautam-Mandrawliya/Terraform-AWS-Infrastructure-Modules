output "Image-ID" {
  value = module.web-app-ami.Image-ID
}

output "Web-App_AMI-ID" {
  value = module.web-app-ami.WebApp_AMI-ID
}

output "ALB-SG-ID" {
  value = module.web-app-alb.SecurityGroup
}

output "WebApp-ALB-ID" {
  value = module.web-app-alb.ALB-ID
}

output "WebApp-DNS-Name" {
  value = module.web-app-alb.ALB-DNS-Name
}

output "TargetGroup-ARN" {
  value = module.web-app-tg.target_group_arn
}