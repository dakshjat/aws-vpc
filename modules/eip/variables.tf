variable "tags" {
  type        = map
  description = "A map of tags to assign to the resource"  
}

variable "vpc" {
  type        = bool
  default     = true
  description = "The EIP is in a VPC or not"  
}