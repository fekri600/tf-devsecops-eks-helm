

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "20.8.4"

  cluster_name    = "${var.project_settings.name_prefix}-${var.project_settings.project}-eks-cluser"
  cluster_version = var.eks.cluster_version
  subnet_ids      = var.subnet_id
  vpc_id          = var.vpc_id

  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = var.eks.eks_managed_node_groups

  enable_irsa = true

  cluster_endpoint_public_access           = true
  enable_cluster_creator_admin_permissions = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  tags = {
    Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-eks-cluser"
  }
}


