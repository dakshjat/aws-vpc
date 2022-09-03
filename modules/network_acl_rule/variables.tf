variable "network_acl_id" {
  type        = string
  description = "The ID of the network ACL"
}

variable "rule_number" {
  type        = number
  description = "The rule number for the entry"
}

variable "egress" {
  type        = bool
  default     = false
  description = "Indicates whether this is an egress rule"
}

variable "protocol" {
  type        = string
  description = "The protocol. A value of -1 means all protocols"
}

variable "rule_action" {
  type        = string
  description = "Indicates whether to allow or deny the traffic that matches the rule"
}

variable "cidr_block" {
  type        = string
  description = "The network range to allow or deny, in CIDR notation"
}

variable "from_port" {
  type        = number
  description = "The from port to match"
}

variable "to_port" {
  type        = number
  description = "The to port to match"
}

