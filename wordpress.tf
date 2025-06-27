module "cert-manager" {
  source            = "./modules/helm_wordpress_release_module/cert-manager"
  route53_zone_id   = module.Route53.zone_id
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider_url = module.eks.oidc_provider_url
  dns_region        = var.aws_region
  domain_name       = module.Route53.domain_name
  depends_on = [
    module.eks,
    module.Route53
  ]
}

module "external-dns" {
  source            = "./modules/helm_wordpress_release_module/external-dns"
  deployment_region = var.aws_region
  k8s_namespace     = var.k8s_namespace
  depends_on = [
    module.cert-manager,
    module.k8s_namespace
  ]
}

module "ingress_nginx" {
  source        = "./modules/helm_wordpress_release_module/ingress"
  k8s_namespace = var.k8s_namespace
  depends_on = [
    module.k8s_namespace
  ]
}

module "wordpress" {
  source                        = "./modules/helm_wordpress_release_module/wordpress"
  db_host                       = module.RDS.rds_instance_id
  db_name                       = module.RDS.db_name
  db_username                   = var.db_username
  db_password                   = var.db_password
  k8s_namespace                 = module.k8s_namespace.interview_k8s_ns
  certificate_secret_identifier = module.cert-manager.certificate_secret_identifier
  wordpress_admin_password      = var.wordpress_admin_password
  depends_on = [
    module.RDS,
    module.k8s_namespace,
    module.cert-manager
  ]
}
