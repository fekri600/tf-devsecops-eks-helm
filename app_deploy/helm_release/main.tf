resource "helm_release" "app" {
  name      = var.name
  namespace = var.namespace
  chart     = var.helm_chart
  # Give Helm more room before Terraform bails out
  timeout          = 600    # seconds
  wait             = true   # default, but be explicit
  atomic           = true   # roll back on failure
  recreate_pods    = true
  cleanup_on_fail  = true   # you already set this

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
