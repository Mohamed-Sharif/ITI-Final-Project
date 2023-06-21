resource "kubernetes_deployment" "nodejsapp" {
  metadata {
    name = "nodejs-app"
    namespace = kubernetes_namespace.dev.metadata[0].name  
    labels = {
      app = "nodejs_app"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nodejs_app"
      }
    }

    template {
      metadata {
        labels = {
          app = "nodejs_app"
        }
      }

      spec {
        container {
          image = "hopa/nodejs_k8s_task"
          name  = "nodejs_app"

          
        }
      }
    }
  }
}


resource "kubernetes_deployment" "mysqldb" {
  metadata {
    name = "mysql-db"
    namespace = kubernetes_namespace.dev.metadata[0].name  
    labels = {
      db = "mysql_db"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        db = "mysql_db"
      }
    }

    template {
      metadata {
        labels = {
          db = "mysql_db"
        }
      }

      spec {
        container {
          name  = "mysql"
          image = "mysql:latest"
          env {
            name  = "MYSQL_ROOT_PASSWORD"
            value_from {
              secret_key_ref {
                name      = kubernetes_secret.mysql-secret.metadata[0].name
                key       = "mysql-root-password"
                optional  = false
              }
            }
          }
          port {
            container_port = 3306
          }
          volume_mount {
            name       = "mysql-data"
            mount_path = "/var/lib/mysql"
          }

          
        }

        volume {
          name = "mysql-data"
          persistent_volume_claim {
            claim_name = kubernetes_persistent_volume_claim.mysql_pvc.metadata[0].name
          }
        }
      }
    }
  }
}