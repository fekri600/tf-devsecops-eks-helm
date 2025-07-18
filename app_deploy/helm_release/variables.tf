
variable "name" {
  description = "Name of the helm release"
  type        = string
}

variable "namespace" {
  description = "Namespace of the helm release"
  type        = string
}

variable "ecr_repo_url" {
  description = "ECR repo URL for the helm release"
  type        = string
}

variable "image_tag" {
  description = "Image tag for the helm release"
  type        = string
}

variable "replica_count" {
  description = "Replica count for the helm release"
  type        = number
}

variable "helm_chart" {
  description = "Helm chart to deploy"
  type        = string
}