# Create Application Load Balancer
resource "aws_lb" "web_app-alb" {
  name                             = "Web-App-ALB"
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = [aws_security_group.web_app_alb-sg.id]
  subnets                          = ["subnet-06109f2563255cfa4", "subnet-0c00e3ea761e75d5b"]
  ip_address_type                  = "ipv4"
  enable_deletion_protection       = false
  enable_http2                     = true
  enable_cross_zone_load_balancing = true
  tags = {
    Environment = "Production-ALB"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.web_app-alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = var.target_group_arn
  }
}