resource "helm_release" "external_dns" {
  name       = local.release_name
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "external-dns"
  version    = "8.8.6"

  namespace        = var.k8s_namespace
  create_namespace = false

  set {
    name  = "provider"
    value = "aws"
  }

  set {
    name  = "aws.region"
    value = var.deployment_region
  }

  set {
    name  = "policy"
    value = "upsert-only"
  }

  set {
    name  = "registry"
    value = "txt"
  }

  set {
    name  = "txtOwnerId"
    value = local.txt_owner_id
  }

  set {
    name  = "serviceAccount.create"
    value = "true"
  }

  set {
    name  = "serviceAccount.name"
    value = local.service_account_name
  }

  set {
    name  = "rbac.create"
    value = "true"
  }

  set {
    name  = "securityContext.fsGroup"
    value = "65534"
  }
}
