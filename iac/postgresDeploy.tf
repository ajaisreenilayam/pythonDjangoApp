resource "kubernetes_deployment" "postgres" {

  metadata {
    name      = "postgres"
    namespace = var.namespace
    labels = {
      app = "postgres"
    }
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "postgres"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }
      spec {
        volume {
          name = "postgres-volume"
          persistent_volume_claim {
            claim_name = "postgres-pvc"
          }
        }
        container {
          volume_mount {
            name       = "postgres-volume"
            mount_path = "/var/lib/postgresql/data"
            sub_path   = "postgres"
          }
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
          liveness_probe {
            tcp_socket {
              port = 5432
            }
          }
          readiness_probe {
            tcp_socket {
              port = 5432
            }
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
