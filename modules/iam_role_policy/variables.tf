variable "name" {
  type        = string
  description = "The name of the role policy"
}

variable "policy" {
  type        = string
  description = "The policy document"
}

variable "role" {
  type        = string
  description = "The name of the IAM role to attach to the policy"
}