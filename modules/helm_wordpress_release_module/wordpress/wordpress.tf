resource "helm_release" "wordpress" {
  name       = "wordpress"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  namespace  = var.k8s_namespace
  version    = "25.0.0"

  values = [
    templatefile("${path.module}/wordpress_values.yaml.tpl", {
      db_host         = var.db_host
      db_name         = var.db_name
      db_user         = var.db_username
      db_password     = var.db_password
      hostname        = local.wordpress_hostname
      tls_secret_name = var.certificate_secret_identifier

    })
  ]
}
