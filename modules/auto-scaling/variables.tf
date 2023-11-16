variable "ports" {
  type = list(number)
}

variable "target_group_arns" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami_id" {
  type = string
}