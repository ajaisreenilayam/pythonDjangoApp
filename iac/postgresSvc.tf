resource "kubernetes_service" "postgres" {
  depends_on = [kubernetes_deployment.postgres]
  metadata {
    name = "db-svc"
    namespace = var.namespace
    #labels = kubernetes_deployment.postgres.metadata.0.app
  }
  spec {
    selector = {
      app = "postgres"
    }
    session_affinity = "ClientIP"
    port {
      port        = 5432
      target_port = 5432
    }

    type = "ClusterIP"
  }
}