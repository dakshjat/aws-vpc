variable "name" {
  type        = string
  description = "Friendly name of the role"
}

variable "assume_role_policy" {
  type        = string
  description = "Policy that grants an entity permission to assume the role"
}