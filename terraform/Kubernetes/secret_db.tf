
resource "kubernetes_secret" "mysql-secret" {
  metadata {
    name      = "mysql-secret"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  data = {
    mysql-root-password = base64encode("123456789")
  }
}


