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
	gh secret set EKS_CLUSTER --body "$$(terraform output -raw cluster_name)"
	gh secret set EKS_CLUSTER_ENDPOINT --body "$$(terraform output -raw cluster_endpoint)"
	gh secret set EKS_CLUSTER_CA --body "$$(terraform output -raw cluster_ca_certificate_data)"
	gh secret set REGION --body "$$(terraform output -raw current_region)"

	@echo "Update Kubeconfig"
	aws eks --region "$$(terraform output -raw current_region)" update-kubeconfig --name "$$(terraform output -raw cluster_name)"

delete:
	@echo " Destroying ECR Repository..."
	terraform destroy -auto-approve

	@echo " Removing GitHub OIDC secret..."
	gh secret delete AWS_ROLE_TO_ASSUME || echo "Secret not found or already deleted."
	gh secret delete ECR_REPO_URL || echo "Secret not found or already deleted."
	gh secret delete EKS_CLUSTER || echo "Secret not found or already deleted."
	gh secret delete EKS_CLUSTER_ENDPOINT || echo "Secret not found or already deleted."
	gh secret delete EKS_CLUSTER_CA || echo "Secret not found or already deleted."
	gh secret delete REGION || echo "Secret not found or already deleted."

	@echo "✅ Delete completed."  

