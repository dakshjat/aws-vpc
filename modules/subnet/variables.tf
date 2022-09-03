variable "vpc_id" {
  type        = string
  description = "The VPC ID"
}

variable "cidr_block" {
  type        = string
  description = "The IPv4 CIDR block for the subnet"
}

variable "availability_zone" {
  type        = string
  description = "AZ for the subnet"
}

variable "map_public_ip_on_launch" {
  type        = bool
  default     = false
  description = "Indicate that instances launched into the subnet should be assigned a public IP address"  
}

variable "tags" {
  type        = map
  description = "A map of tags to assign to the subnet resource"  
}