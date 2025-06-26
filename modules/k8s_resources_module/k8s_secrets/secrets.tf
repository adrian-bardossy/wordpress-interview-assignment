resource "aws_kms_ciphertext" "db_password_encrypted" {
  key_id    = var.kms_key_id
  plaintext = var.db_password
}

resource "kubernetes_secret" "db_password" {
  metadata {
    name      = local.db_password
    namespace = var.k8s_namespace
  }

  data = {
    password = base64encode(aws_kms_ciphertext.db_password_encrypted.ciphertext_blob)
  }

  type = "Opaque"

  depends_on = [aws_kms_ciphertext.db_password_encrypted]
}
