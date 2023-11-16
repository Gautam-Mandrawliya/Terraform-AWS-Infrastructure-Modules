# Create Target Group
resource "aws_lb_target_group" "web_app-tg" {
  name                              = "Web-App-TargetGroup"
  port                              = 80
  protocol                          = "HTTP"
  ip_address_type                   = "ipv4"
  load_balancing_cross_zone_enabled = true
  protocol_version                  = "HTTP1"
  health_check {
    enabled             = true
    path                = "/"
    healthy_threshold   = 5
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    matcher             = "200-209"
  }
  vpc_id = var.vpc_id
}