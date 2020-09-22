variable "check" {

  validation {
    condition = can(var.check.id)
    error_message = "Label must have an `id` key."
  }

  validation {
    condition = can(var.check.tags)
    error_message = "Label must have a `tag` key."
  }

  validation {
    condition = can(var.check.tags.Name)
    error_message = "Label must have a `tag.Name` key."
  }

  validation {
    condition = can(var.check.tags.Environment)
    error_message = "Label must have a `tag.Environment` key."
  }

  validation {
    condition = can(var.check.tags.ManagedBy)
    error_message = "Label must have a `tag.ManagedBy` key."
  }
}