
variable "helm" {
  description = "Helm configuration"
  type = object({
    name                        = string
    namespace                   = string
    ecr_repo_url                = string
    image_tag                   = string
    replica_count               = number
    cluster_name                = string
    cluster_endpoint            = string
    cluster_ca_certificate_data = string

  })
}

