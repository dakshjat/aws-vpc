provider "aws" {
  region = "ap-south-1"
}

module "vpc" {
  source = "./modules/vpc"
  
  cidr_block           = var.vpc_cidr_block      
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name        = "${var.environment}-vpc"
    Environment = var.environment
  }
}

data "aws_region" "current" {}

data "aws_availability_zones" "current" {}

module "public_subnet_1" {
  source = "./modules/subnet"
  
  vpc_id                  = module.vpc.id
  cidr_block              = var.public_subnet_1_cidr_block
  availability_zone       = data.aws_availability_zones.current.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-public-subnet-1"
    Environment = var.environment
  }
}

module "public_subnet_2" {
  source = "./modules/subnet"
  
  vpc_id                  = module.vpc.id
  cidr_block              = var.public_subnet_2_cidr_block
  availability_zone       = data.aws_availability_zones.current.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-public-subnet-2"
    Environment = var.environment
  }
}

module "app_subnet_1" {
  source = "./modules/subnet"
  
  vpc_id                  = module.vpc.id
  cidr_block              = var.app_subnet_1_cidr_block
  availability_zone       = data.aws_availability_zones.current.names[0]
  tags = {
    Name        = "${var.environment}-app-subnet-1"
    Environment = var.environment
  }
}

module "app_subnet_2" {
  source = "./modules/subnet"
  
  vpc_id                  = module.vpc.id
  cidr_block              = var.app_subnet_2_cidr_block
  availability_zone       = data.aws_availability_zones.current.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-app-subnet-2"
    Environment = var.environment
  }
}

module "db_subnet_1" {
  source = "./modules/subnet"
  
  vpc_id                  = module.vpc.id
  cidr_block              = var.db_subnet_1_cidr_block
  availability_zone       = data.aws_availability_zones.current.names[0]
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-db-subnet-1"
    Environment = var.environment
  }
}

module "db_subnet_2" {
  source = "./modules/subnet"
  
  vpc_id                  = module.vpc.id
  cidr_block              = var.db_subnet_2_cidr_block
  availability_zone       = data.aws_availability_zones.current.names[1]
  map_public_ip_on_launch = true
  tags = {
    Name        = "${var.environment}-db-subnet-2"
    Environment = var.environment
  }
}


module "public_subnet_rt_1" {
  source = "./modules/route_table"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-public-subnet-rt-1"
    Environment = var.environment
  }
}

module "public_subnet_rt_2" {
  source = "./modules/route_table"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-public-subnet-rt-2"
    Environment = var.environment
  }
}

module "app_subnet_rt_1" {
  source = "./modules/route_table"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-app-subnet-rt-1"
    Environment = var.environment
  }
}

module "app_subnet_rt_2" {
  source = "./modules/route_table"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-app-subnet-rt-2"
    Environment = var.environment
  }
}

module "db_subnet_rt_1" {
  source = "./modules/route_table"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-db-subnet-rt-1"
    Environment = var.environment
  }
}

module "db_subnet_rt_2" {
  source = "./modules/route_table"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-db-subnet-rt-2"
    Environment = var.environment
  }
}

module "public_subnet_rt_association_1" {
  source = "./modules/subnet_route_table_association"
  
  subnet_id      = module.public_subnet_1.id
  route_table_id = module.public_subnet_rt_1.id
}

module "public_subnet_rt_association_2" {
  source = "./modules/subnet_route_table_association"
  
  subnet_id      = module.public_subnet_2.id
  route_table_id = module.public_subnet_rt_2.id
}

module "app_subnet_rt_association_1" {
  source = "./modules/subnet_route_table_association"
  
  subnet_id      = module.app_subnet_1.id
  route_table_id = module.app_subnet_rt_1.id
}

module "app_subnet_rt_association_2" {
  source = "./modules/subnet_route_table_association"
  
  subnet_id      = module.app_subnet_2.id
  route_table_id = module.app_subnet_rt_2.id
}

module "db_subnet_rt_association_1" {
  source = "./modules/subnet_route_table_association"
  
  subnet_id      = module.db_subnet_1.id
  route_table_id = module.db_subnet_rt_1.id
}

module "db_subnet_rt_association_2" {
  source = "./modules/subnet_route_table_association"
  
  subnet_id      = module.db_subnet_2.id
  route_table_id = module.db_subnet_rt_2.id
}

module "igw" {
  source = "./modules/internet_gateway"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-vpc-igw"
    Environment = var.environment
  }
}

module "nat_gw_eip_1" {
  source = "./modules/eip"
  
  tags = {
    Name = "${var.environment}-vpc-nat-gw-eip-1"
    Environment = var.environment
  }
}

module "nat_gw_eip_2" {
  source = "./modules/eip"
  
  tags = {
    Name = "${var.environment}-vpc-nat-gw-eip-2"
    Environment = var.environment
  }
}

module "nat_gw_1" {
  source = "./modules/nat_gateway"
  
  allocation_id = module.nat_gw_eip_1.allocation_id
  subnet_id     = module.public_subnet_1.id
  tags = {
    Name = "${var.environment}-vpc-nat-gw-1"
    Environment = var.environment
  }
}

module "nat_gw_2" {
  source = "./modules/nat_gateway"
  
  allocation_id = module.nat_gw_eip_2.allocation_id
  subnet_id     = module.public_subnet_2.id
  tags = {
    Name = "${var.environment}-vpc-nat-gw-2"
    Environment = var.environment
  }
}

module "route_igw_public_subnet_1" {
  source = "./modules/route_igw"
  
  route_table_id         = module.public_subnet_rt_1.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.igw.id
}

module "route_igw_public_subnet_2" {
  source = "./modules/route_igw"
  
  route_table_id         = module.public_subnet_rt_2.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = module.igw.id
}

module "route_nat_gw_app_subnet_1" {
  source = "./modules/route_nat_gw"
  
  route_table_id         = module.app_subnet_rt_1.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.nat_gw_2.id
}

module "route_nat_gw_app_subnet_2" {
  source = "./modules/route_nat_gw"
  
  route_table_id         = module.app_subnet_rt_2.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = module.nat_gw_2.id
}

module "public_subnet_network_acl" {
  source = "./modules/network_acl"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-public-subnet-nacl"
    Environment = var.environment
  }
}

module "app_subnet_network_acl" {
  source = "./modules/network_acl"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-app-subnet-nacl"
    Environment = var.environment
  }
}

module "db_subnet_network_acl" {
  source = "./modules/network_acl"
  
  vpc_id = module.vpc.id
  tags = {
    Name = "${var.environment}-db-subnet-nacl"
    Environment = var.environment
  }
}

module "public_subnet_network_acl_association_1" {
  source = "./modules/network_acl_association"
  
  subnet_id      = module.public_subnet_1.id
  network_acl_id = module.public_subnet_network_acl.id
}

module "public_subnet_network_acl_association_2" {
  source = "./modules/network_acl_association"
  
  subnet_id      = module.public_subnet_2.id
  network_acl_id = module.public_subnet_network_acl.id
}

module "app_subnet_network_acl_association_1" {
  source = "./modules/network_acl_association"
  
  subnet_id      = module.app_subnet_1.id
  network_acl_id = module.app_subnet_network_acl.id
}

module "app_subnet_network_acl_association_2" {
  source = "./modules/network_acl_association"
  
  subnet_id      = module.app_subnet_2.id
  network_acl_id = module.app_subnet_network_acl.id
}

module "db_subnet_network_acl_association_1" {
  source = "./modules/network_acl_association"
  
  subnet_id      = module.db_subnet_1.id
  network_acl_id = module.db_subnet_network_acl.id
}

module "db_subnet_network_acl_association_2" {
  source = "./modules/network_acl_association"
  
  subnet_id      = module.db_subnet_2.id
  network_acl_id = module.db_subnet_network_acl.id
}

module "public_subnet_network_acl_rule_ingress" {
  source = "./modules/network_acl_rule"
  
  network_acl_id = module.public_subnet_network_acl.id
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = "-1"
  to_port        = "-1"
}

module "public_subnet_network_acl_rule_egress" {
  source = "./modules/network_acl_rule"
  
  network_acl_id = module.public_subnet_network_acl.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = "-1"
  to_port        = "-1"
}

module "app_subnet_network_acl_rule_ingress" {
  source = "./modules/network_acl_rule"
  
  network_acl_id = module.app_subnet_network_acl.id
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = "-1"
  to_port        = "-1"
}

module "app_subnet_network_acl_rule_egress" {
  source = "./modules/network_acl_rule"
  
  network_acl_id = module.app_subnet_network_acl.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = "-1"
  to_port        = "-1"
}

module "db_subnet_network_acl_rule_ingress" {
  source = "./modules/network_acl_rule"
  
  network_acl_id = module.db_subnet_network_acl.id
  rule_number    = 100
  egress         = false
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = "-1"
  to_port        = "-1"
}

module "db_subnet_network_acl_rule_egress" {
  source = "./modules/network_acl_rule"
  
  network_acl_id = module.db_subnet_network_acl.id
  rule_number    = 100
  egress         = true
  protocol       = "-1"
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = "-1"
  to_port        = "-1"
}

module "vpc_s3_gateway_endpoint" {
  source = "./modules/vpc_endpoint"
  
  vpc_id       = module.vpc.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"
  tags         = {
    Name = "${var.environment}-vpc-s3-endpoint"
    Environment = var.environment
  }
}

module "public_vpc_endpoint_rt_association_1" {
  source = "./modules/vpc_endpoint_route_table_association"
  
  vpc_endpoint_id = module.vpc_s3_gateway_endpoint.id
  route_table_id  = module.public_subnet_rt_1.id
}

module "public_vpc_endpoint_rt_association_2" {
  source = "./modules/vpc_endpoint_route_table_association"
  
  vpc_endpoint_id = module.vpc_s3_gateway_endpoint.id
  route_table_id  = module.public_subnet_rt_2.id
}

module "app_vpc_endpoint_rt_association_1" {
  source = "./modules/vpc_endpoint_route_table_association"
  
  vpc_endpoint_id = module.vpc_s3_gateway_endpoint.id
  route_table_id  = module.app_subnet_rt_1.id
}

module "app_vpc_endpoint_rt_association_2" {
  source = "./modules/vpc_endpoint_route_table_association"
  
  vpc_endpoint_id = module.vpc_s3_gateway_endpoint.id
  route_table_id  = module.app_subnet_rt_2.id
}

module "db_vpc_endpoint_rt_association_1" {
  source = "./modules/vpc_endpoint_route_table_association"
  
  vpc_endpoint_id = module.vpc_s3_gateway_endpoint.id
  route_table_id  = module.db_subnet_rt_1.id
}

module "db_vpc_endpoint_rt_association_2" {
  source = "./modules/vpc_endpoint_route_table_association"
  
  vpc_endpoint_id = module.vpc_s3_gateway_endpoint.id
  route_table_id  = module.db_subnet_rt_2.id
}

module "vpcflowlogs_iam_role" {
  source = "./modules/iam_role"
  
  name                = "vpcflowlogs-role"
  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

module "vpcflowlogs_iam_role_policy" {
  source = "./modules/iam_role_policy"
  
  name   = "vpcflowlogs-role-policy"
  role   = module.vpcflowlogs_iam_role.id
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "arn:aws:logs:*:*:log-group:/vpc/flowlog/vpc-*"
    }
  ]
}
EOF
}

module "vpcflowlogs_cloudwatch_log_group" {
  source = "./modules/cloudwatch_log_group"
  
  name                = "/vpc/flowlog/${module.vpc.id}"
  retention_in_days   = 7
  tags                = {
    Name = "${var.environment}-vpc-flowlog-cw-log-group"
    Environment = var.environment
  }
}

module "vpcflowlogs" {
  source = "./modules/flow_log"
  
  iam_role_arn             = module.vpcflowlogs_iam_role.arn
  log_destination_type     = "cloud-watch-logs"
  log_destination          = module.vpcflowlogs_cloudwatch_log_group.arn
  traffic_type             = "ALL"
  vpc_id                   = module.vpc.id
  max_aggregation_interval = 60
  tags                = {
    Name = "${var.environment}-vpc-flowlog"
    Environment = var.environment
  }
}