variable "project_settings" {
  description = "Project configuration settings"
  type = object({
    project     = string
    aws_region  = string
    name_prefix = string
  })
}


variable "oidc_url" {
  description = "OIDC provider URL"
  type        = string
}

variable "oidc_client_id_list" {
  description = "OIDC client IDs"
  type        = list(string)
}

variable "oidc_thumbprint_list" {
  description = "OIDC thumbprint list"
  type        = list(string)
}

variable "iam_role_name" {
  description = "IAM role name"
  type        = string
}

variable "iam_policy_name" {
  description = "IAM policy name"
  type        = string
}
