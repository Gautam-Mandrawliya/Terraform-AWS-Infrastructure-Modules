variable "ports" {
  type = list(number)
}

variable "target_group_arns" {
  description = "List of Target Group ARNs for the ALB."
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}