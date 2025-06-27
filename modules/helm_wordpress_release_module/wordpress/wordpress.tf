resource "helm_release" "wordpress" {
  name       = "wordpress"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "wordpress"
  namespace  = var.k8s_namespace
  version    = "15.1.0" # example version

  values = [
    templatefile("${path.module}/wordpress_values.yaml.tpl", {
      db_host     = var.db_host
      db_name     = local.db_name
      db_user     = var.db_username
      db_password = var.db_password
    })
  ]
}
