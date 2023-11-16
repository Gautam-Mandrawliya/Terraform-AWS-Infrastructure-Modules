data "aws_ami" "linux" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "name"
    values = ["${var.image_name}"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "ec2-instance" {
  ami               = data.aws_ami.linux.id
  availability_zone = var.availability_zone
  instance_type     = var.instance_type
  user_data         = file("${path.module}/app.sh")
}

# Create an AMI from the EC2 instance
resource "aws_ami_from_instance" "ec2_ami" {
  source_instance_id = aws_instance.ec2-instance.id
  name               = "Web-App-AMI"
  tags = {
    Name = "Web-App Amazon Linux AMI"
  }
}

resource "null_resource" "terminate_ec2_instance" {
  # Ensure that the instance is kept running while the AMI creation is in progress
  depends_on = [aws_ami_from_instance.ec2_ami]

  provisioner "local-exec" {
    command = "aws ec2 terminate-instances --instance-ids ${aws_instance.ec2-instance.id}"
  }
}