resource "helm_release" "ingress_nginx" {
  name             = local.helm_release_name
  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  version          = "4.4.2"
  namespace        = var.k8s_namespace
  create_namespace = false

  values = [file("${path.module}/ingress-nginx-values.yml")]
}
