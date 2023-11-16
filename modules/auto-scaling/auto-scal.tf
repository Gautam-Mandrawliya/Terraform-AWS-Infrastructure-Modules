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

resource "aws_launch_configuration" "webapp-asg_launch_config" {
#  name_prefix          = "asg-launch-config-"
  name = "web-app-launch-conf"
  image_id             = var.ami_id
  instance_type        = var.instance_type
  security_groups      = [aws_security_group.webapp-asg-sg.id]
  iam_instance_profile = aws_iam_instance_profile.asg_instance_profile.name
}

resource "aws_autoscaling_group" "webapp-asg" {
#  name_prefix                 = "my-asg-"
  name = "web-app-asg"
  max_size                    = 5
  min_size                    = 1
  desired_capacity            = 1
  launch_configuration        = aws_launch_configuration.webapp-asg_launch_config.name
  vpc_zone_identifier         = ["subnet-06109f2563255cfa4", "subnet-0c00e3ea761e75d5b"]
  target_group_arns           = [ var.target_group_arns ]
  health_check_type           = "ELB"
  health_check_grace_period   = 300
  wait_for_capacity_timeout   = "10m"

  tag {
    key                 = "Name"
    value               = "WebApp-ASG-Instance"
    propagate_at_launch = true
  }
}