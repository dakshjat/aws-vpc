output "id" {
  value       = aws_vpc.this.id
  description = "The ID of the VPC"
}

output "arn" {
  value       = aws_vpc.this.arn
  description = "Amazon Resource Name (ARN) of VPC"
}