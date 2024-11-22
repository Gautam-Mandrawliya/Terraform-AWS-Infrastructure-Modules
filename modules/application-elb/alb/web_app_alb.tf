# Create Application Load Balancer
resource "aws_lb" "web_app-alb" {
  name                             = "Web-App-ALB"
  internal                         = false
  load_balancer_type               = "application"
  security_groups                  = [aws_security_group.web_app_alb-sg.id]
  subnets                          = ["subnet-07528de53c17e11a5", "subnet-0babe537cc4557c87"]
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