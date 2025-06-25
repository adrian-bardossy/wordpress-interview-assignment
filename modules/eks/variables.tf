variable "vpc_id" {
  type = string
  description = "VPC ID of the cluster to be deployed into"
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnets in which is cluster deployed into"
}

