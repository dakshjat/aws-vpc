output "id" {
  value       = aws_iam_role.this.id
  description = "Name of the IAM role"
}

output "arn" {
  value       = aws_iam_role.this.arn
  description = "Amazon Resource Name (ARN) specifying the role"
}