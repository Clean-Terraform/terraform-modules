variable "env" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev'."
}

variable "name" {
  type        = string
  description = "Solution name, e.g. `user-service` or `jenkins`."
}

variable "key" {
  type        = string
  description = "The secret key name, e.g. mysql_password."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags, e.g. `{team = \"foo\"}`."
}

locals {
  delimiter  = "/"

  id         = "/${lower(join(local.delimiter, compact(concat(list(var.env, var.name), list(var.key)))))}"
  env        = lower(format("%v", var.env))

  tags = merge(
    {
      "Name"            = local.id
      "Environment"     = local.env
			"Managed By"      = "Terraform"
    },
    var.tags
  )

  outputs = {
    env = local.env
    id  = local.id
    tags = local.tags
  }
}

module "i_base_label" {
  source = "../base/interface"
  check = local.outputs
}

module "validate_standard_label" {
  source = "./validate"
  check = local.outputs
}

output "outputs" {
  value       = local.outputs
  description = "[Label Interface](https://github.com/Clean-Terraform/terraform-modules/tree/master/generic/labels/base/interface/README.md)"
}
