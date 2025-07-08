module "oidc" {
  source = "./oidc"

  # Pass remaining variables from bootstrap
  iam_role_name        = var.iam_role_name
  iam_policy_name      = var.iam_policy_name
  oidc_url             = var.oidc_url
  oidc_client_id_list  = var.oidc_client_id_list
  oidc_thumbprint_list = var.oidc_thumbprint_list
  policies_path = local.policies 
}


module "ecr" {
  source           = "./ecr"
  project_settings = var.project_settings
  policies_path = local.policies
}
