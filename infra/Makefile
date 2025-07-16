.ONESHELL:
.SHELLFLAGS = -e -o pipefail -c
ENVIRONMENTS = staging production

deploy:
	@echo " Create an ECR Repository ..."
	terraform init && terraform apply -auto-approve
	@echo "✅ Apply completed."

	@echo " Setting GitHub secrets..."
	gh secret set AWS_ROLE_TO_ASSUME --body "$$(terraform output -raw TRUST_ROLE_GITHUB)"
	gh secret set ECR_REPO_URL --body "$$(terraform output -raw ecr_repo_url)"


delete:
	@echo " Destroying ECR Repository..."
	terraform destroy -auto-approve

	@echo " Removing GitHub OIDC secret..."
	gh secret delete AWS_ROLE_TO_ASSUME || echo "Secret not found or already deleted."


	@echo "✅ Delete completed."  

