variable "project_settings" {
  description = "Project configuration settings"
  type = object({
    project     = string
    aws_region  = string
    name_prefix = string
  })
}


variable "oidc" {
  description = "OIDC provider and IAM role configuration"
  type = object({
    url             = string
    client_id_list  = list(string)
    thumbprint_list = list(string)
    iam_role_name   = string
    iam_policy_name = string
  })
}
