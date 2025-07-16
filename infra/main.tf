module "oidc" {
  source       = "./oidc" # path to the oidc module
  oidc         = var.oidc # oidc configuration
  policies_path = local.policies # path to the policies directory
}


module "ecr" {
  source           = "./ecr"
  project_settings = var.project_settings
  policies_path = local.policies
}

