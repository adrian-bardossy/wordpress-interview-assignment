variable "aws_region" {
  type        = string
  description = "region to deploy the aws resources into"
}

#VPC

variable "vpc_name" {
  type        = string
  description = "vpc_name"
}

#RDS
variable "db_username" {
  sensitive   = true
  type        = string
  description = "db username"
}

variable "db_password" {
  type        = string
  description = "db password"
  sensitive   = true
}

#Bastion

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

#Route53
variable "a_record_alias" {
  description = "ALIAS record config, if using AWS resources"
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  })
  default = null
}

variable "a_record_values" {
  description = "List of record values (IP addresses, etc.)"
  type        = list(string)
  default     = []
}

#ACM
variable "domain_name" {
  description = "The domain name for the certificate"
  type        = string
}

#KMS
variable "kms_alias_name" {
  type        = string
  description = "Alias for the kms key"
}

### k8s variables
# k8s ns
variable "k8s_namespace" {
  type        = string
  description = "k8s deployment namespace"
}

# k8s storage
variable "k8s_storage_class_name" {
  type        = string
  description = "storage class name"
}

variable "k8s_pv_name" {
  type        = string
  description = "k8s pv wordpress name"
}

variable "k8s_pvc_name" {
  type        = string
  description = "k8s pvc name"
}

### helm vars
# cert-manager