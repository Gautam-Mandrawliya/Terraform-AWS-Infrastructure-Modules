variable "ports" {
  type = list(number)
}

variable "region" {
  type = string
}

variable "image_name" {
  type = string
}

variable "availability_zone" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "key_name" {
  type        = string
  description = "The name of the key pair to use for the instance"
}