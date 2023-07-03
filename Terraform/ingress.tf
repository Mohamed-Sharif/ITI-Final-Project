resource "kubernetes_ingress" "nexus_ingress" {
  metadata {
    name      = "nexus-ingress"
    namespace = "tools"

    annotations = {
      "kubernetes.io/ingress.class"                 = "nginx"
      "nginx.ingress.kubernetes.io/proxy-body-size" = "0"
    }
  }

  spec {
    rule {
      host = "nexus.local.com"

      http {
        path {
          path     = "/"
          pathType = "Prefix"

          backend {
            service_name = "nexus-service"
            service_port = 80
          }
        }
      }
    }

    rule {
      host = "docker.local.com"

      http {
        path {
          path     = "/"
          pathType = "Prefix"

          backend {
            service_name = "nexus-service"
            service_port = 5000
          }
        }
      }
    }

    rule {
      host = "jenkins.local.com"

      http {
        path {
          path     = "/"
          pathType = "Prefix"

          backend {
            service_name = "jenkins-service"
            service_port = 8080
          }
        }
      }
    }
  }
}

resource "kubernetes_ingress" "nodejs_ingress" {
  metadata {
    name      = "nodejs-ingress"
    namespace = "dev"

    annotations = {
      "kubernetes.io/ingress.class"                 = "nginx"
      "nginx.ingress.kubernetes.io/proxy-body-size" = "0"
    }
  }

  spec {
    rule {
      host = "nodejs.local.com"

      http {
        path {
          path     = "/"
          pathType = "Prefix"

          backend {
            service_name = "nodejs-service"
            service_port = 3000
          }
        }
      }
    }
  }
}
