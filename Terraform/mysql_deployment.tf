resource "kubernetes_deployment" "mysql" {
  metadata {
    name      = "mysql"
    namespace = "dev"
  }

  spec {
    selector {
      match_labels = {
        "app" = "mysql"
      }
    }

    replicas = 1

    template {
      metadata {
        labels = {
          "app" = "mysql"
        }
      }

      spec {
        container {
          name  = "mysql"
          image = "mysql:latest"

          env {
            name = "MYSQL_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name = "mysql-secrets"
                key  = "mysql-root-password"
              }
            }
          }

          env {
            name = "MYSQL_USER"
            value_from {
              secret_key_ref {
                name = "mysql-secrets"
                key  = "mysql-user"
              }
            }
          }

          env {
            name = "MYSQL_PASSWORD"
            value_from {
              secret_key_ref {
                name = "mysql-secrets"
                key  = "mysql-password"
              }
            }
          }

          port {
            container_port = 3306
            name           = "mysql"
          }
        }
      }
    }
  }
}
