resource "aws_iam_instance_profile" "asg_instance_profile" {
  name = "asg-instance-profile"
  role = aws_iam_role.webapp-asg_role.name
}

resource "aws_iam_role" "webapp-asg_role" {
  name = "WebApp-Asg-Role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

#resource "aws_launch_configuration" "webapp-asg_launch_config" {
#  name_prefix          = "asg-launch-config-"
#  name = "web-app-launch-conf"
#  image_id             = var.ami_id
#  instance_type        = var.instance_type
#  security_groups      = [aws_security_group.webapp-asg-sg.id]
#  iam_instance_profile = aws_iam_instance_profile.asg_instance_profile.name
#}

resource "aws_launch_template" "webapp_launch_template" {
  name = "web-app-launch-template"

  iam_instance_profile {
    name = aws_iam_instance_profile.asg_instance_profile.name
  }

  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    security_groups = [aws_security_group.webapp-asg-sg.id]
  }
}

resource "aws_autoscaling_group" "webapp-asg" {
  name                        = "web-app-asg"
  max_size                    = 4
  min_size                    = 2
  desired_capacity            = 2
#  launch_configuration       = aws_launch_configuration.webapp-asg_launch_config.name
  vpc_zone_identifier         = ["subnet-07528de53c17e11a5", "subnet-0babe537cc4557c87"]
  target_group_arns           = [ var.target_group_arns ]
  health_check_type           = "ELB"
  health_check_grace_period   = 300
# wait_for_capacity_timeout   = "10m"

  launch_template {
    id      = aws_launch_template.webapp_launch_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "WebApp-ASG-Instance"
    propagate_at_launch = true
  }
}