module "k8s_namespace" {
  source        = "./modules/k8s_resources_module/k8s_namespace"
  k8s_namespace = var.k8s_namespace
}