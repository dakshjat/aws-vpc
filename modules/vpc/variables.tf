variable "cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the VPC"
}

variable "instance_tenancy" {
  type        = string
  default     = "default"
  description = "A tenancy option for instances launched into the VPC"
}

variable "enable_dns_support" {
  type        = bool
  default     = true
  description = "Enable or disable DNS support in the VPC"
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = false
  description = "enable or disable DNS hostnames in the VPC"  
}

variable "tags" {
  type        = map
  description = "A map of tags to assign to the vpc resource"  
}
