data "aws_eks_cluster" "this" {
  name = var.cluster_name
}

data "aws_eks_cluster_auth" "this" {
  name = var.cluster_name
}

provider "helm" {
  kubernetes {
    host                   = data.aws_eks_cluster.this.endpoint
    cluster_ca_certificate = base64decode(data.aws_eks_cluster.this.certificate_authority[0].data)
    token                  = data.aws_eks_cluster_auth.this.token
  }
}

resource "helm_release" "app" {
  name       = "devsecops-app"
  namespace  = "default"
  chart      = var.helm.chart

  set {
    name  = "image.repository"
    value = var.ecr_repo_url
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
