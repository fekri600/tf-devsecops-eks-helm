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

module "vpc" {
  source           = "./vpc"
  project_settings = var.project_settings
  network          = var.network
}

module "eks" {
  source           = "./eks"
  project_settings = var.project_settings
  eks              = var.eks
  vpc_id           = module.vpc.vpc_id
  subnet_id        = module.vpc.private_subnet_ids
}