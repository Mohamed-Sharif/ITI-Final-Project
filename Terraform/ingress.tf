resource "kubernetes_ingress_v1" "nexus_ingress" {
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
          backend {
            service {
              name = "nexus-service"
              port {
                number = 80
              }
            }
          }

          path = "/"
        }
    }
     }

rule {
      host = "docker.local.com"
      http {
        path {
          backend {
            service {
              name = "nexus-service"
              port {
                number = 5000
              }
            }
          }

          path = "/"
        }
    }

}
  rule {
      host = "jenkins.local.com"
      http {
        path {
          backend {
            service {
              name = "jenkins-service"
              port {
                number = 8080
              }
            }
          }

          path = "/"
        }
    }

    }  
 }

}

resource "kubernetes_ingress_v1" "nodejs_ingress" {
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
          backend {
            service {
              name = "nodejs-service"
              port {
                number = 3000
              }
            }
          }

          path = "/"
        }
    }

  }
}
}