resource "null_resource" "kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --region ${var.region} --name ${var.clustername}"
  }
  depends_on = [time_sleep.wait_5_seconds]
}

resource "time_sleep" "wait_5_seconds" {
  create_duration = "2s"
}