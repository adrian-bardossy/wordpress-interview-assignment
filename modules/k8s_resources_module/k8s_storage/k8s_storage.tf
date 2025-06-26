resource "kubernetes_storage_class_v1" "wordpress_storage_class" {
  metadata {
    name = var.k8s_storage_class_name
    annotations = {
      "storageclass.kubernetes.io/is-default-class"       = "true"
      "storageclass.kubernetes.io/allow-volume-expansion" = "true"
    }
  }

  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Retain"
  volume_binding_mode = "WaitForFirstConsumer"

  parameters = {
    type   = "gp3"
    fsType = "ext4"
  }
}

resource "kubernetes_persistent_volume" "wordpress_ebs_pv" {
  metadata {
    name = var.k8s_pv_name
  }

  spec {
    capacity = {
      storage = "20Gi"
    }
    access_modes                     = ["ReadWriteOnce"]
    persistent_volume_reclaim_policy = "Retain"
    storage_class_name               = kubernetes_storage_class_v1.wordpress_storage_class.metadata[0].name

    persistent_volume_source {
      aws_elastic_block_store {
        volume_id = var.ebs_volume_id
        fs_type   = "ext4"
      }
    }
  }
}

resource "kubernetes_persistent_volume_claim" "wordpress_ebs_pvc" {
  metadata {
    name      = var.k8s_pvc_name
    namespace = var.k8s_namespace
  }

  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = kubernetes_storage_class_v1.wordpress_storage_class.metadata[0].name
    resources {
      requests = {
        storage = "20Gi"
      }
    }
  }
}
