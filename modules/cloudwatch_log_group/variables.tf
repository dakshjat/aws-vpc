variable "name" {
  type        = string
  description = "The name of the log group"
}

variable "retention_in_days" {
  type        = number
  description = "Specifies the number of days you want to retain log events in the specified log group"
}

variable "tags" {
  type        = map
  description = "A map of tags to assign to the resource"
}
