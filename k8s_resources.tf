module "k8s_namespace" {
  source        = "./modules/k8s_resources_module/k8s_namespace"
  k8s_namespace = var.k8s_namespace
}

module "k8s_storage" {
  source                 = "./modules/k8s_resources_module/k8s_storage"
  k8s_storage_class_name = var.k8s_storage_class_name
  k8s_pv_name            = var.k8s_pv_name
  k8s_pvc_name           = var.k8s_pvc_name
  k8s_namespace          = module.k8s_namespace.interview_k8s_ns
  ebs_volume_id          = module.EBS.ebs_volume_id
}

module "k8s_secrets" {
  source        = "./modules/k8s_resources_module/k8s_secrets"
  k8s_namespace = module.k8s_namespace.interview_k8s_ns
  db_password   = var.db_password
  kms_key_id    = module.KMS.key_id
}