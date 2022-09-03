variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR Block"
}

variable "public_subnet_1_cidr_block" {
  type        = string
  description = "Public Subnet 1 CIDR Block"
}

variable "public_subnet_2_cidr_block" {
  type        = string
  description = "Public Subnet 2 CIDR Block"
}

variable "app_subnet_1_cidr_block" {
  type        = string
  description = "Application Subnet 1 CIDR Block"
}

variable "app_subnet_2_cidr_block" {
  type        = string
  description = "Application Subnet 2 CIDR Block"
}

variable "db_subnet_1_cidr_block" {
  type        = string
  description = "Database Subnet 1 CIDR Block"
}

variable "db_subnet_2_cidr_block" {
  type        = string
  description = "Database Subnet 2 CIDR Block"
}