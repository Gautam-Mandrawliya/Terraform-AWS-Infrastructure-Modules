module "web-app-ami" {
  source            = "./modules/aws-ami"
  image_name        = var.image_name
  instance_type     = var.instance_type
  availability_zone = var.availability_zone
}

module "web-app-alb" {
  source            = "./modules/application-elb/alb"
  availability_zone = var.availability_zone
  ports             = var.ports
  target_group_arn  = module.web-app-tg.target_group_arn
}

module "web-app-tg" {
  source = "./modules/application-elb/target-group"
  vpc_id = var.vpc_id
}

module "web-app-asg" {
  source            = "./modules/auto-scaling"
  ports             = var.ports
  instance_type     = var.instance_type
  ami_id            = module.web-app-ami.WebApp_AMI-ID
  target_group_arns = module.web-app-tg.target_group_arn
}