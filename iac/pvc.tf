resource "kubernetes_persistent_volume_claim" "postgres-volume" {

  metadata {
    name      = "postgres-pvc"
    namespace = var.namespace
  }
  spec {
    access_modes       = ["ReadWriteOnce"]
    storage_class_name = "gp2"
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}
#kubernetes_persistent_volume_claim.postgres-volume.name