# ======================
# Project Configuration
# ======================
project_settings = {
  project     = "i2507devsecops"
  aws_region  = "us-east-1"
  name_prefix = "fs"
}

# ---- GitHub OIDC Provider and IAM Role Configuration ----
oidc_url             = "https://token.actions.githubusercontent.com"
oidc_client_id_list  = ["sts.amazonaws.com"]
oidc_thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]

iam_role_name   = "TRUST_ROLE_GITHUB"
iam_policy_name = "github_permission_policy"


eks = {

  cluster_version = "1.29"

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      max_size     = 3
      min_size     = 1

      instance_types = ["t3.medium"]
    }
  }
}

network = {
    enable_dns_support       = true
    enable_dns_hostnames     = true
    vpc_cidr                 = "10.0.0.0/16"
    public_subnets           = ["10.0.1.0/24", "10.0.2.0/24"]
    private_subnets          = ["10.0.11.0/24", "10.0.12.0/24"]
    availability_zones       = ["us-east-1a", "us-east-1b"]
    eip_domain               = "vpc"
    default_route_cidr_block = "0.0.0.0/0"
  }