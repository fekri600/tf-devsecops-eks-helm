variable "project_settings" {
  description = "Project configuration settings"
  type = object({
    project     = string
    aws_region  = string
    name_prefix = string
  })
}


variable "oidc" {
  description = "OIDC provider and IAM role configuration"
  type = object({
    url             = string
    client_id_list  = list(string)
    thumbprint_list = list(string)
    iam_role_name   = string
    iam_policy_name = string
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