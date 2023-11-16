resource "aws_security_group" "web_app_alb-sg" {
  name        = "Web-app-alb-sg"
  description = "Allow TLS inbound traffic for Terraform-Host EC2 instance."

  # Add custom security group rules here, e.g., for SSH and custom ports
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description      = "TLS from VPC"
      from_port        = port.value
      to_port          = port.value
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "Web-App-ALB-SG"
  }
}