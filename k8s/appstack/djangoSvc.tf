resource "kubernetes_service" "django" {
  metadata {
    name = "django-svc"
  }
  spec {
    selector = {
      app = django
    }
    session_affinity = "ClientIP"
    port {
      port        = 8080
      target_port = 8000
    }

    type = "LoadBalancer"
  }
}