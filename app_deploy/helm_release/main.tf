resource "helm_release" "app" {
  name      = "devsecops-app"
  namespace = "default"
  chart     = var.helm_chart

  set {
    name  = "image.repository"
    value = var.helm.ecr_repo_url
  }

  set {
    name  = "image.tag"
    value = var.helm.image_tag
  }

  set {
    name  = "replicaCount"
    value = var.helm.replica_count
  }

}
