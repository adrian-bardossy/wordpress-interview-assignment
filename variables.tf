variable "aws_region" {
  type        = string
  description = "Region to deploy the aws resources into"
}

#VPC

variable "vpc_name" {
  type        = string
  description = "Name of the vpc"
}

#RDS
variable "db_username" {
  sensitive   = true
  type        = string
  description = "Name of the db user"
}

variable "db_password" {
  type        = string
  description = "MariaDB database password"
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
  description = "Definition of your public IP to be able to access the bastion instance from"
}

#Route53
variable "a_record_alias" {
  description = "ALIAS record config used for Route53"
  type = object({
    name                   = string
    zone_id                = string
    evaluate_target_health = bool
  })
  default = null
}

variable "domain_name" {
  type = string
  description = "Domain name used for route53 deployment"
}

variable "a_record_values" {
  description = "List of record values (IP addresses, etc.)"
  type        = list(string)
  default     = []
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
  description = "k8s deployment namespace for the wordpress aplication deployment"
}

# k8s storage
variable "k8s_storage_class_name" {
  type        = string
  description = "storage class name to use for the deployment"
}

variable "k8s_pv_name" {
  type        = string
  description = "k8s persistent volume  wordpress name"
}

variable "k8s_pvc_name" {
  type        = string
  description = "k8s persistent volume claim name"
}

### helm vars
# wordpress helm release
variable "wordpress_admin_password" {
  type      = string
  sensitive = true
  description = "Wordpress admin password to access the admin GUI"
}
