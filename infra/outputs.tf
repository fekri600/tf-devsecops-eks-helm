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