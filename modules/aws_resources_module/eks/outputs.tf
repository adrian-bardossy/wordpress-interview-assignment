output "cluster_name" {
  value = module.eks.cluster_name
  description = "Name of the EKS cluster"
}

output "cluster_endpoint" {
  value = module.eks.cluster_endpoint
  description = "EKS cluster endpoint published record needed for the kubernetes and helm providers"
}

output "cluster_ca_data" {
  value = module.eks.cluster_certificate_authority_data
  description = "EKS cluster ca data for the provider usage(kubernetes, helm)"
}

output "oidc_provider_url" {
  description = "The URL of the OIDC provider for the EKS cluster"
  value       = module.eks.cluster_oidc_issuer_url
}

data "aws_caller_identity" "current" {}

output "oidc_provider_arn" {
  description = "The ARN of the OIDC provider for the EKS cluster"
  value       = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${replace(module.eks.cluster_oidc_issuer_url, "https://", "")}"
}
