resource "kubernetes_secret" "mysql_secrets" {
  metadata {
    name      = "mysql-secrets"
    namespace = "dev"
  }

  data = {
    mysql-root-password = "admin"
    mysql-user         = "sqluser"
    mysql-password     = "password"
  }

  type = "Opaque"
}

