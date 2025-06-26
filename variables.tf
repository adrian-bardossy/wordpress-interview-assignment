variable "aws_region" {
  type        = string
  description = "region to deploy the aws resources into"
}

variable "vpc_name" {
  type        = string
  description = "vpc_name"
}

variable "db_password" {
  type        = string
  description = "db password"
  sensitive   = true
}

variable "instance_key_name" {
  type        = string
  description = "Name of the instance key pair"
}

variable "instance_name" {
  type        = string
  description = "Name of the AWS instance"
}

variable "public_ip" {
  type = string
}