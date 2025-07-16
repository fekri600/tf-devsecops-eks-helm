
# Get the current AWS account ID
data "aws_caller_identity" "current" {}

# Build the OIDC provider ARN dynamically


locals {

  oidc_provider_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/token.actions.githubusercontent.com"
}


# Define the GitHub OIDC provider in AWS (if not already set up)
resource "aws_iam_openid_connect_provider" "github" {
  url             = var.oidc.url
  client_id_list  = var.oidc.client_id_list
  thumbprint_list = var.oidc.thumbprint_list
}


# Define the IAM role GitHub Actions can assume using OIDC
resource "aws_iam_role" "github_trust_role" {
  name = var.oidc.iam_role_name

  assume_role_policy = templatefile("${var.policies_path}/github-trust-policy.json", {
    oidc_provider_arn = local.oidc_provider_arn
  })
}


# Define the IAM policy with necessary permissions
resource "aws_iam_policy" "github_devops_policy" {
  name = var.oidc.iam_policy_name
  policy = templatefile("${var.policies_path}/github-permission-policy.json", {

  })
}


# Attach the policy to the IAM role
resource "aws_iam_role_policy_attachment" "github_actions_permissions" {
  role       = aws_iam_role.github_trust_role.name
  policy_arn = aws_iam_policy.github_devops_policy.arn
}

