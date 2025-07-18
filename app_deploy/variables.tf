
variable "name" {
  description = "Name of the helm release"
  type        = string
}

variable "namespace" {
  description = "Namespace of the helm release"
  type        = string
}

variable "replica_count" {
  description = "Replica count for the helm release"
  type        = number
}

variable "image_tag" {
  description = "Image tag for the helm release"
  type        = string
}

variable "ecr_repo_url" {
  description = "ECR repo URL for the helm release"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "cluster_ca_certificate_data" {
  description = "EKS cluster CA certificate data"
  type        = string
}

variable "cluster_endpoint" {
  description = "EKS cluster endpoint"
  type        = string
}

