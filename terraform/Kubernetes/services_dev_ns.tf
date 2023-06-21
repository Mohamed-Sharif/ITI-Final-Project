resource "kubernetes_service" "mysql_service" {
  metadata {
    name      = "mysql"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    selector = {
      db = "mysql_db"
    }

    port {
      port        = 3306
      target_port = 3306
    }

    type = "NodePort"
  }
}



resource "kubernetes_service" "nodejs_service" {
  metadata {
    name      = "nodejs-service"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    selector = {
      app = "nodejs_app"
    }

    port {
      port        = 3000
      target_port = 3000
    }

    type = "NodePort"
  }
}