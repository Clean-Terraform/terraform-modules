variable "env" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. `user-service` or `jenkins`"
}

variable "suffix" {
  type        = list(string)
  default     = []
  description = "Additional attributes to add to the name."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags, e.g. `{team = \"foo\"}`."
}

locals {
  delimiter  = "-"

  id         = lower(join(local.delimiter, compact(concat([var.env, var.name], var.suffix))))
  name       = lower(format("%v", var.name))
  env        = lower(format("%v", var.env))

  tags = merge(
    {
      "Name"            = local.id
      "Environment"     = local.env
      "ManagedBy"       = "Terraform"
    },
    var.tags
  )

  outputs = {
    env = local.env
    id  = local.id
    name = local.name
    tags = local.tags
  }
}

module "iface_label" {
  source = "../iface"
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
