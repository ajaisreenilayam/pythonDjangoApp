resource "kubernetes_namespace" "bettermarks" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      education = "value"
    }

    name = "bettermarks"
  }
}