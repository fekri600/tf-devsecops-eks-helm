# ---- Project Configuration ----
project_settings = {
  project     = "i2507devsecops" # project name (used for naming resources)
  aws_region  = "us-east-1"      # aws region
  name_prefix = "fs"             # name prefix (used for naming resources)
}

# ---- GitHub OIDC Provider and IAM Role Configuration ----
oidc = {
  url             = "https://token.actions.githubusercontent.com" # oidc url
  client_id_list  = ["sts.amazonaws.com"]                         # client id list
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"]  # thumbprint list
  iam_role_name   = "TRUST_ROLE_GITHUB"                           # iam role name
  iam_policy_name = "github_permission_policy"
}

# ---- EKS Cluster Configuration ----
eks = {
  cluster_version = "1.33"
  eks_managed_node_groups = {
    default = {
      desired_size   = 2             # desired size of the node group
      max_size       = 3             # max size of the node group
      min_size       = 1             # min size of the node group
      instance_types = ["t3.medium"] # instance types
    }
  }
}

# ---- Network Configuration ----
network = {
  enable_dns_support       = true                             # enable dns support
  enable_dns_hostnames     = true                             # enable dns hostnames
  vpc_cidr                 = "10.0.0.0/16"                    # vpc cidr
  public_subnets           = ["10.0.1.0/24", "10.0.2.0/24"]   # public subnets
  private_subnets          = ["10.0.11.0/24", "10.0.12.0/24"] # private subnets
  availability_zones       = ["us-east-1a", "us-east-1b"]     # availability zones
  eip_domain               = "vpc"                            # eip domain
  default_route_cidr_block = "0.0.0.0/0"                      # default route cidr block
}

