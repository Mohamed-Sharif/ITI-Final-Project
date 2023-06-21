resource "kubernetes_service" "jenkins" {
  metadata {
    name = "jenkins"
    namespace = kubernetes_namespace.tools.metadata[0].name  
  }

  spec {
    selector = {
      tool = "jenkins"
    }

    port {
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}


resource "kubernetes_service" "nexus" {
  metadata {
    name = "nexus"
   namespace = kubernetes_namespace.tools.metadata[0].name    
  }

  spec {
    selector = {
      tool = "nexus"
    }

    port {
      port        = 8081
      target_port = 8081
    }

    type = "NodePort"
  }
}