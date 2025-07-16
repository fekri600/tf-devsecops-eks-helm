

variable "cluster_name" {
  description = "Cluster name"
  type = string
}

variable "ecr_repo_url" {
  description = "ECR repository URL"
  type = string
}   

variable "helm" {
  description = "Helm configuration"
  type = object({
    name = string
    namespace = string
    image_tag = string
    replica_count = number
  })
}