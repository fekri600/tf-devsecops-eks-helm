output "ecr_repo_url" {
  value = aws_ecr_repository.devsecops.repository_url
}

output "ecr_repo_name" {
  value = aws_ecr_repository.devsecops.name
}