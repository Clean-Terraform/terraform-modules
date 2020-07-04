variable "check" {}


locals {
  has_id = try(var.check.id)

  # Tags
  tags_have_name = try(var.check.tags.Name)
  tags_have_environment = try(var.check.tags.Environment)
  tags_have_managed_by = try(var.check.tags["Managed By"])
}

output "outputs" {
  value = var.check
}
