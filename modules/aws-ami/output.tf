output "Image-ID" {
  value = data.aws_ami.linux.id
}

output "WebApp_AMI-ID" {
  value = aws_ami_from_instance.ec2_ami.id
}