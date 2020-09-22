variable "check" {
  validation {
    condition = can(regex("^[a-z-]+$", var.check.id))
    error_message = "Label must only be alpha-numeric and `-` characters."
  }
}