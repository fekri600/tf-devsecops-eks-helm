
data "aws_caller_identity" "current" {}

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


access_entries = {
  github_ci = {
    principal_arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${var.github_trust_role}"

    policy_associations = {
      admin = {
        policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
        access_scope = {
          type = "cluster"
        }
      }
    }
  }
}


  tags = {
    Name = "${var.project_settings.name_prefix}-${var.project_settings.project}-eks-cluser"
  }
}


