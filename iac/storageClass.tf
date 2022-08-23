resource "kubernetes_storage_class" "gp2" {
  metadata {
    name = "gp2"
    annotations = {
        "storageclass.kubernetes.io/is-default-class" : "true"
    } 
  }
  storage_provisioner = "kubernetes.io/aws-ebs"
  reclaim_policy      = "Delete"
  parameters = {
    type = "gp2"
    fsType= "ext4"
  }
}