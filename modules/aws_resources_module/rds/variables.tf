variable "vpc_id" {
  type        = string
  description = "Name of the VPC ID for the deployment"
}

variable "db_username" {
  type        = string
  description = "Name of the database username"
}
variable "db_password" {
  type        = string
  description = "Database password"
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets in which is cluster deployed into"
}