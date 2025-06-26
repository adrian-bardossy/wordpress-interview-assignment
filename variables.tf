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
