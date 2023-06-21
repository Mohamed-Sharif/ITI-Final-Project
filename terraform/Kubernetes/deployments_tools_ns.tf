
resource "kubernetes_deployment" "jenkins" {
  metadata {
    name = "jenkins"
    namespace = kubernetes_namespace.tools.metadata[0].name  
    labels = {
      tool = "jenkins"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        tool = "jenkins"
      }
    }

    template {
      metadata {
        labels = {
          tool = "jenkins"
        }
      }

      spec {
        container {
          name  = "jenkins"
          image = "jenkins/jenkins:lts"
          port {
            container_port = 8080
          }

          
        }
      }
    }
  }
}



resource "kubernetes_deployment" "nexus" {
  metadata {
    name = "nexus"
    namespace = kubernetes_namespace.tools.metadata[0].name  
    labels = {
      tool = "nexus"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        tool = "nexus"
      }
    }

    template {
      metadata {
        labels = {
          tool = "nexus"
        }
      }

      spec {
        container {
          image = "sonatype/nexus3:latest"
          name  = "nexus"
          port {
            container_port = 8081
          }
          
        }
      }
    }
  }
}