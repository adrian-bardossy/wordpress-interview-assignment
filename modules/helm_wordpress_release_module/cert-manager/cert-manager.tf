resource "helm_release" "cert_manager" {
  name       = local.cert_manager_helm_release_name
  repository = "https://charts.jetstack.io"
  chart      = "cert-manager"
  version    = "v1.18.1"
  namespace  = local.cert_manager_ns

  create_namespace = true

  set {
    name  = "installCRDs"
    value = "true"
  }

  set {
    name  = "serviceAccount.create"
    value = "false"
  }

  set {
    name  = "serviceAccount.name"
    value = "cert-manager"
  }

  set {
    name  = "serviceAccount.annotations.eks\\.amazonaws\\.com/role-arn"
    value = aws_iam_role.cert_manager_route53.arn
  }
}

resource "kubernetes_manifest" "cert_manager_clusterissuer" {
  manifest = {
    apiVersion = "cert-manager.io/v1"
    kind       = "ClusterIssuer"
    metadata = {
      name      = "letsencrypt-dns"
      namespace = local.cert_manager_ns
    }
    spec = {
      acme = {
        server = "https://acme-v02.api.letsencrypt.org/directory"
        email  = local.email
        privateKeySecretRef = {
          name = "letsencrypt-dns-private-key"
        }
        solvers = [
          {
            dns01 = {
              route53 = {
                region       = var.dns_region
                hostedZoneID = var.route53_zone_id
                role         = aws_iam_role.cert_manager_route53.arn
              }
            }
          }
        ]
      }
    }
  }
}
