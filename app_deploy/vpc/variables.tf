variable "project_settings" {
  description = "Project configuration settings"
  type = object({
    project     = string
    aws_region  = string
    name_prefix = string
  })
}

variable "network" {
  type = object({
    enable_dns_support       = bool
    enable_dns_hostnames     = bool
    vpc_cidr                 = string
    public_subnets           = list(string)
    private_subnets          = list(string)
    availability_zones       = list(string)
    eip_domain               = string
    default_route_cidr_block = string
  })
}