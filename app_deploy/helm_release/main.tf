resource "helm_release" "app" {
  name      = var.name
  namespace = var.namespace
  chart     = var.helm_chart

  timeout          = 600
  wait             = true
  atomic           = true
  recreate_pods    = true
  cleanup_on_fail  = true

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

  # Override service port (default 80 → 3000)
  set {
    name  = "service.port"
    value = 3000
  }

  # Also update container probes (if chart supports it)
  set {
    name  = "livenessProbe.httpGet.port"
    value = 3000
  }
  set {
    name  = "readinessProbe.httpGet.port"
    value = 3000
  }
}
