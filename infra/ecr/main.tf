

resource "aws_ecr_repository" "devsecops" {
  name = "${var.project_settings.name_prefix}-${var.project_settings.project}"

  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "aws_ecr_lifecycle_policy" "devsecops" {
  repository = aws_ecr_repository.devsecops.name

  policy = file("${var.policies_path}/ecr-lifecycle-policy.json")
}
