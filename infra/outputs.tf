output "ecr_repo_url" {
  value = module.ecr.ecr_repo_url
}

output "TRUST_ROLE_GITHUB" {
  value = module.oidc.TRUST_ROLE_GITHUB
}

output "ecr_repo_name" {
  value = module.ecr.ecr_repo_name
}


output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_id" {
  value = module.vpc.private_subnet_ids

}

output "public_subnet_id" {
  value = module.vpc.public_subnet_ids

}

output "cluster_endpoint" {
  value = module.eks.eks_cluster_endpoint
}

output "cluster_name" {
  value = module.eks.eks_cluster_name
}

output "cluster_ca_certificate_data" {
  value = module.eks.eks_cluster_certificate_authority_data
}


