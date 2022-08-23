resource "kubernetes_deployment" "nginx" {
  metadata {
    name = "django"
    namespace = "bettermarks"
    labels = {
      App = "django"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "django"
      }
    }
    template {
      metadata {
        labels = {
          App = "django"
        }
      }
      spec {
        container {
          image = "ajais/django:v1"
          name  = "django"

          port {
            container_port = 8000
          }

          resources {
            limits = {
              cpu    = "0.5"
              memory = "512Mi"
            }
            requests = {
              cpu    = "250m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
