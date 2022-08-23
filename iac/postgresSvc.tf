resource "kubernetes_service" "postgres" {
  metadata {
    name = "db-svc"
    namespace = "bettermarks"
  }
  spec {
    selector = {
      app = kubernetes_deployment.postgres.metadata.0.labels.app
    }
    session_affinity = "ClientIP"
    port {
      port        = 5432
      target_port = 5432
    }

    type = "ClusterIP"
  }
}