output "id" {
  value       = aws_vpc_endpoint_route_table_association.this.id
  description = "A hash of the EC2 Route Table and VPC Endpoint identifiers"
}