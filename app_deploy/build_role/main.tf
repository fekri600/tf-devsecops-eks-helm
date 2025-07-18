# Get the AWS Account ID (to build the role ARN dynamically)
data "aws_caller_identity" "current" {}

# Build the role ARN for GitHub Actions dynamically
locals {
  github_actions_role_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/TRUST_ROLE_GITHUB"
}

# Patch or create the aws-auth ConfigMap with the GitHub Actions role
resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name      = "aws-auth"
    namespace = "kube-system"
  }

  # Add the role to system:masters group for cluster admin
  data = {
    mapRoles = yamlencode([
      {
        rolearn  = local.github_actions_role_arn
        username = "github-actions"
        groups   = ["system:masters"]
      }
    ])
  }
}