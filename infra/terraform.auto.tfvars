# ---- Project Configuration ----
project_settings = {
  project     = "i2507devsecops" # project name (used for naming resources)
  aws_region  = "us-east-1" # aws region
  name_prefix = "fs" # name prefix (used for naming resources)
}

# ---- GitHub OIDC Provider and IAM Role Configuration ----
oidc = {
  url             = "https://token.actions.githubusercontent.com" # oidc url
  client_id_list  = ["sts.amazonaws.com"] # client id list
  thumbprint_list = ["6938fd4d98bab03faadb97b34396831e3780aea1"] # thumbprint list
  iam_role_name   = "TRUST_ROLE_GITHUB" # iam role name
  iam_policy_name = "github_permission_policy"  
}


