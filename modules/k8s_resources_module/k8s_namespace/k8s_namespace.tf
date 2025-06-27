resource "kubernetes_namespace" "interview_namespace" {
  metadata {
    name = var.k8s_namespace
    labels = {
      User       = "Adrian_Interview_Test"
      DeployedBy = "Terraform"
    }
  }
}
