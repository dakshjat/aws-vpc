output "allocation_id" {
  value       = aws_eip.this.allocation_id
  description = " ID that AWS assigns to represent the allocation of the Elastic IP address for use with instances in a VPC"
}

output "public_ip" {
  value       = aws_eip.this.public_ip
  description = "Contains the public IP address"
}

