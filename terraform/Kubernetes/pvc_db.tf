resource "kubernetes_persistent_volume_claim" "mysql_pvc" {
  metadata {
    name      = "mysql-pvc"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    access_modes = ["ReadWriteOnce"]
    resources {
      requests = {
        storage = "5Gi"
      }
    }
  }
}