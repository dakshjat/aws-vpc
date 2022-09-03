variable "allocation_id" {
  type        = string
  description = "The Allocation ID of the Elastic IP address for the gateway"
}

variable "subnet_id" {
  type        = string
  description = "The Subnet ID of the subnet in which to place the gateway"
}

variable "tags" {
  type        = map
  description = "A map of tags to assign to the resource"  
}