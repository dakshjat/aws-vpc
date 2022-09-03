variable "iam_role_arn" {
  type        = string
  description = "The ARN for the IAM role that's used to post flow logs to a CloudWatch Logs log group"
  default     = null
}

variable "log_destination_type" {
  type        = string
  default     = "cloud-watch-logs"
  description = "Specifies the number of days you want to retain log events in the specified log group"
}

variable "log_destination" {
  type        = string
  description = "The type of the logging destination"
}

variable "traffic_type" {
  type        = string
  description = "The type of traffic to capture"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID to attach to"
}

variable "max_aggregation_interval" {
  type        = number
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record"
}

variable "tags" {
  type        = map
  description = "A map of tags to assign to the resource"
}