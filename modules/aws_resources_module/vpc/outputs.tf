output "vpc_name" {
  value = module.vpc.name
  description = "Name of the deployed VPC"
}

output "vpc_id" {
  value = module.vpc.vpc_id
  description = "ID of the deployed VPC"
}

output "vpc_public_subnet_id" {
  value = module.vpc.public_subnets
  description = "ID of the deployed subnet IDs inside of the VPC"
}

output "vpc_private_subnet_id" {
  value = module.vpc.private_subnets
  description = "ID of the private subnets deployed inside of the VPC"
}

output "vpc_cidr_block" {
  description = "Primary CIDR block of the VPC"
  value       = module.vpc.vpc_cidr_block
}
