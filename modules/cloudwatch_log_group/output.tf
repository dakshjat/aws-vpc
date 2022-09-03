output "arn" {
  value       = aws_cloudwatch_log_group.this.arn
  description = "The Amazon Resource Name (ARN) specifying the log group"
}