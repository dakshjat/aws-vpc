output "id" {
  value       = aws_route_table.this.id
  description = "The ID of the routing table"
}

output "arn" {
  value       = aws_route_table.this.arn
  description = "The ARN of the route table"
}