resource "kubernetes_deployment" "jenkins" {
  metadata {
    name      = "jenkins"
    namespace = "tools"

    labels = {
      app = "jenkins"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "jenkins"
      }
    }

    template {
      metadata {
        labels = {
          app = "jenkins"
        }
      }

      spec {
        container {
          name  = "jenkins"
          image = "jenkins/jenkins:lts-jdk11"

          port {
            container_port = 8080
          }

          security_context {
          allow_privilege_escalation = false
          run_as_user = 0
          }

          volume_mount {
            name       = "jenkins-home"
            mount_path = "/var/jenkins_home"
          }
          volume_mount {
            name       = "docker-socket"
            mount_path = "/var/run/docker.sock"
          }
        }

        volume {
          name = "jenkins-home"
          empty_dir {}
        }
        volume {
          name = "docker-socket"
          host_path {
            path = "/var/run/docker.sock"
          }
        }
      }
    }
  }
      
}


resource "kubernetes_deployment" "nexus" {
  metadata {
    name      = "nexus"
    namespace = "tools"
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "nexus"
      }
    }

    template {
      metadata {
        labels = {
          app = "nexus"
        }
      }

      spec {
        container {
          image = "sonatype/nexus3"
          name  = "nexus"

          port {
            name          = "nexus"
            container_port = 8081
          }

          port {
            name          = "docker"
            container_port = 5000
          }
        }
      }
    }
  }
}
