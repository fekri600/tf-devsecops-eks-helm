resource "helm_release" "app" {
  name      = var.name
  namespace = var.namespace
  chart     = var.helm_chart
  cleanup_on_fail = true

  set {
    name  = "image.repository"
    value = var.ecr_repo_url
  }

  set {
    name  = "image.tag"
    value = var.image_tag
  }

  set {
    name  = "replicaCount"
    value = var.replica_count
  }
}
