variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "db_username" {
  type        = string
  description = "db username"
}
variable "db_password" {
  type        = string
  description = "db password"
  sensitive   = true
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnets in which is cluster deployed into"
}