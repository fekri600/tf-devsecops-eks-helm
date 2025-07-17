
module "helm_release" {
  source     = "./helm_release"
  helm       = var.helm
  helm_chart = local.helm_path
}