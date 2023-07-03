resource "kubernetes_service" "mysql_svc" {
  metadata {
    name      = "mysql-svc"
    namespace = "dev"
  }

  spec {
    type = "NodePort"

    port {
      port        = 3306
      target_port = 3306
      node_port   = 32002
    }

    selector = {
      "app" = "mysql"
    }
  }
}
