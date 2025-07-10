variable "project_settings" {
  description = "Project configuration settings"
  type = object({
    project     = string
    aws_region  = string
    name_prefix = string
  })
}


variable "oidc_url" {
  description = "OIDC provider URL"
  type        = string
}

variable "oidc_client_id_list" {
  description = "OIDC client IDs"
  type        = list(string)
}

variable "oidc_thumbprint_list" {
  description = "OIDC thumbprint list"
  type        = list(string)
}

variable "iam_role_name" {
  description = "IAM role name"
  type        = string
}

variable "iam_policy_name" {
  description = "IAM policy name"
  type        = string
}

variable "eks" {
  description = "EKS cluster configuration"
  type = object({

    cluster_version = string

    eks_managed_node_groups = map(object({
      desired_size = number
      max_size     = number
      min_size     = number
      instance_types = list(string)
    }))
  })
}

variable "network" {
  description = "Network configuration"
  type = object({
    enable_dns_support       = bool
    enable_dns_hostnames     = bool
    vpc_cidr                 = string
    public_subnets           = list(string)
    private_subnets          = list(string)
    availability_zones       = list(string)
    eip_domain               = string
    default_route_cidr_block = string
  })
}