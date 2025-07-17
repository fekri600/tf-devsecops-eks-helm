

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


module "helm_release" {
  source           = "./helm_release"
  helm             = var.helm
  helm_chart = local.helm_path  
}