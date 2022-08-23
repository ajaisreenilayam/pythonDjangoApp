resource "kubernetes_deployment" "postgres" {
  metadata {
    name = "postgres"
    namespace = "bettermarks"
    labels = {
      App = "postgres"
    }
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        App = "postgres"
      }
    }
    template {
      metadata {
        labels = {
          App = "postgres"
        }
      }
      spec {
        container {
          image = "postgres"
          name  = "postgres"

          env {
          name  = "POSTGRES_USER"
          value = "postgres"
          }
          env {
          name  = "POSTGRES_PASSWORD"
          value = "postgres"
          }
          env {
          name  = "POSTGRES_DB"
          value = "postgres"
          }

          port {
            container_port = 5432
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
