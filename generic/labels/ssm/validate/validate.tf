variable "check" {}


locals {
  id_valid = try(regex("^[a-z/]+$", var.check.id))
}

output "outputs" {
  value = var.check
}
