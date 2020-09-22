variable "check" {
  validation {
    condition = can(regex("^/[a-z/]+$", var.check.id))
    error_message = "Label must begin with `/` and only be alpha-numeric and `/` characters."
  }
}