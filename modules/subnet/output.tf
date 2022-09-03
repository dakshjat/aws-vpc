output "id" {
  value       = aws_subnet.this.id
  description = "The ID of the subnet"
}

output "arn" {
  value       = aws_subnet.this.arn
  description = "Amazon Resource Name (ARN) of the subnet"
}