
module "helm_release" {
  source                    = "./helm_release"
  name                      = var.name
  namespace                 = var.namespace
  ecr_repo_url              = var.ecr_repo_url
  image_tag                 = var.image_tag
  replica_count             = var.replica_count
  helm_chart                = local.helm_path
}