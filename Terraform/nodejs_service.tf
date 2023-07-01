resource "kubernetes_service" "nodejs_service" {
  metadata {
    name      = "nodejs-service"
    namespace = "dev"
  }

  spec {
    selector = {
      app = "nodejs-app"
    }
    type = "NodePort"

    port {
      protocol    = "TCP"
      port        = 3000
      target_port = 3000
      node_port   = 30000
    }
  }
}
