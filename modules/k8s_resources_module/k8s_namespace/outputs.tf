output "interview_k8s_ns" {
  value = kubernetes_namespace.interview_namespace.metadata[0].name
}
