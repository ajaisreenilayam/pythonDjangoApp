resource "kubernetes_persistent_volume_claim" "postgres-volume" {
    depends_on = [
  kubernetes_storage_class.gp2
]
  metadata {
    name = "postgres-pvc"
    namespace = var.namespace
  }
  spec {
    access_modes = ["ReadWriteOnce"]
    storage_class_name = "gp2"
    resources {
      requests = {
        storage = "1Gi"
      }
    }
  }
}
#kubernetes_persistent_volume_claim.postgres-volume.name