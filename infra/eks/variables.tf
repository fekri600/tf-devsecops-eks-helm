variable "project_settings" {
  description = "Project configuration settings"
  type = object({
    project     = string
    aws_region  = string
    name_prefix = string
  })
}

variable "eks" {
  description = "EKS cluster configuration"
  type = object({
    cluster_version = string
    eks_managed_node_groups = map(object({
      desired_size   = number
      max_size       = number
      min_size       = number
      instance_types = list(string)
    }))
  })
}

variable "vpc_id" {
  type = string
}
variable "subnet_id" {
  type = list(string)
}
