output "id" {
  value       = aws_vpc_endpoint.this.id
  description = "The ID of the VPC endpoint"
}

output "arn" {
  value       = aws_vpc_endpoint.this.arn
  description = "The Amazon Resource Name (ARN) of the VPC endpoint"
}