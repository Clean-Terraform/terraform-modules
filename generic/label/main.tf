variable "env" {
  type        = string
  description = "Environment, e.g. 'prod', 'staging', 'dev'"
}

variable "name" {
  type        = string
  description = "Solution name, e.g. `user-service` or `jenkins`"
}

variable "suffix" {
  type        = string
  default     = ""
  description = "Additional attributes to add to the name."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
}

locals {
  delimiter        = "-"

  id = lower(join(local.delimiter, compact(concat(list(var.env, var.name), var.suffix))))
  name       = lower(format("%v", var.name))
  env        = lower(format("%v", var.env))

  tags = merge(
    {
      "Name"            = local.id
      "Environment"     = local.env
			"Managed By"      = "Terraform"
    },
    var.tags
  )
}

output "env" {
  value       = local.env
  description = "Normalized Environment"
}

output "id" {
  value       = local.id
  description = "Disambiguated ID"
}

output "name" {
  value       = local.name
  description = "Normalized name"
}

output "tags" {
  value       = local.tags
  description = "Normalized Tag map"
}
