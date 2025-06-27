variable "route53_zone_id" {
  type        = string
  description = "route53 dns zone id"
}

variable "oidc_provider_arn" {
  type = string
  description = "OIDC provider ARN (Amazon Resource Name)"
}

variable "oidc_provider_url" {
  type = string
  description = "OIDC provider URL"
}

variable "dns_region" {
  type        = string
  description = "Region of cluster issuer"
}

variable "domain_name" {
  type = string
  description = "Domain name used in the hosted zone"
}
