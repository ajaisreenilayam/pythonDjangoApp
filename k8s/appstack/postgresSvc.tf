resource "kubernetes_service" "postgres" {
  metadata {
    name = "db-svc"
  }
  spec {
    selector = {
      app = postgres
    }
    session_affinity = "ClientIP"
    port {
      port        = 5432
      target_port = 5432
    }

    type = "ClusterIP"
  }
}