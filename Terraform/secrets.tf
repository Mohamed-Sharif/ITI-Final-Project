resource "kubernetes_secret" "mysql_secrets" {
  metadata {
    name      = "mysql-secrets"
    namespace = "dev"
  }

  data = {
    mysql-root-password = "admin"
    mysql-user         = "ITI-Graduation-Project"
    mysql-password     = "123456789"
  }

  type = "Opaque"
}
