

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version         = "20.8.4"

  cluster_name    = "${var.project_settings.name_prefix}-${var.project_settings.project}-eks-cluser"
  cluster_version = var.eks.cluster_version
  subnet_ids      = var.subnet_id
  vpc_id          = var.vpc_id

  eks_managed_node_groups = var.eks.eks_managed_node_groups

  enable_irsa = true
}
