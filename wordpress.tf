module "cert-manager" {
  source            = "./modules/helm_wordpress_release_module/cert-manager"
  route53_zone_id   = module.Route53.zone_id
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider_url = module.eks.oidc_provider_url
  dns_region        = var.dns_region
}