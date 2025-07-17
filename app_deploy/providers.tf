terraform {
  required_version = "1.11.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.97.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "~> 2.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

data "aws_eks_cluster_auth" "this" {
  name = var.helm.cluster_name
}

provider "helm" {
  kubernetes {
    host                   = var.helm.cluster_endpoint
    cluster_ca_certificate = base64decode(var.helm.cluster_ca_certificate_data[0].data)
    token                  = ata.aws_eks_cluster_auth.this.token
  }
}


