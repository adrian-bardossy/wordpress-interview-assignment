variable "route53_zone_id" {
  type        = string
  description = "route53 dns zone id"
}

variable "oidc_provider_arn" {
  type = string
}

variable "oidc_provider_url" {
  type = string
}

variable "dns_region" {
  type        = string
  description = "region of cluster issuer"
}
