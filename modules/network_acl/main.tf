resource "aws_network_acl" "this" {
  vpc_id = var.vpc_id
  tags   = var.tags
}