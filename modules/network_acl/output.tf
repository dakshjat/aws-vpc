output "id" {
  value       = aws_network_acl.this.id
  description = "The ID of the network ACL"
}

output "arn" {
  value       = aws_network_acl.this.arn
  description = "The ARN of the network ACL"
}