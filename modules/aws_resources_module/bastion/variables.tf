variable "instance_name" {
  type = string
  description = "Name of the ec2 instance"
}

variable "vpc_subnet" {
  type = string
  description = "Subnet used for the instance"
}

variable "instance_key_name" {
  type = string
  description = "Instance KP key name to access the instance with"
}

variable "public_ip" {
  type = string
  description = "Public IP to be used to be able to access the instance from please consider using IP/32"
}

variable "vpc_id" {
  type = string
  description = "VPC ID used to deploy the instance into"
}