variable "ports" {
  type = list(number)
}

variable "availability_zone" {
  type = string
}

variable "target_group_arn" {
  type = string
}