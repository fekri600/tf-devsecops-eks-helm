output "ecr_repo_url" {
  value = module.ecr.ecr_repo_url
}

output "TRUST_ROLE_GITHUB" {
  value = module.oidc.TRUST_ROLE_GITHUB
}

output "ecr_repo_name" {
  value = module.ecr.ecr_repo_name
}

