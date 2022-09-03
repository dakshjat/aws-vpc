resource "aws_eip" "this" {
  tags   = var.tags
  vpc    = var.vpc
}