variable "vpc_id" {
  type        = string
  description = "The ID of the VPC in which the endpoint will be used"
}

variable "service_name" {
  type        = string
  description = "The service name"
}

variable "tags" {
  type        = map
  description = "A map of tags to assign to the resource"  
}