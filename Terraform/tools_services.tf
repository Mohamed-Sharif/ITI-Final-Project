resource "kubernetes_service" "jenkins-service" {
  metadata {
    name      = "jenkins-service"
    namespace = "tools"
  }

  spec {
    selector = {
      app = "jenkins"
    }

    port {
      name        = "http"
      protocol    = "TCP"
      port        = 8080
      target_port = 8080
    }

    type = "NodePort"
  }
}


resource "kubernetes_service" "nexus-service" {
  metadata {
    name      = "nexus-service"
    namespace = "tools"
  }

  spec {
    selector = {
      app = "nexus"
    }

    port {
      name        = "http"
      port        = 80
      protocol    = "TCP"
      target_port = 8081
    }
  }
    provisioner "local-exec" {
    command = "kubectl apply -f ingress.yaml"
}
}

resource "kubernetes_service" "docker-service" {
  metadata {
    name      = "docker-service"
    namespace = "tools"
  }

  spec {
    selector = {
      app = "nexus"
    }
    port {
      name        = "docker"
      port        = 5000
      protocol    = "TCP"
      target_port = 5000
    }

    type = "ClusterIP"
  }
}
