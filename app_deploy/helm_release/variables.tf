
variable "helm" {
  description = "Helm configuration"
  type = object({
    name          = string
    namespace     = string
    image_tag     = string
    ecr_repo_url  = string
    replica_count = number
  })
}

variable "helm_chart" {
  type = string
}