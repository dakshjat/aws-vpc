output "vpc_id" {
  value = module.vpc.id
}

output "public_subnet_1_id" {
  value = module.public_subnet_1.id
}

output "public_subnet_2_id" {
  value = module.public_subnet_2.id
}

output "app_subnet_1_id" {
  value = module.app_subnet_1.id
}

output "app_subnet_2_id" {
  value = module.app_subnet_2.id
}

output "db_subnet_1_id" {
  value = module.db_subnet_1.id
}

output "db_subnet_2_id" {
  value = module.db_subnet_2.id
}

output "public_subnet_rt_1_id" {
  value = module.public_subnet_rt_1.id
}

output "public_subnet_rt_2_id" {
  value = module.public_subnet_rt_2.id
}

output "app_subnet_rt_1_id" {
  value = module.app_subnet_rt_1.id
}

output "app_subnet_rt_2_id" {
  value = module.app_subnet_rt_2.id
}

output "db_subnet_rt_1_id" {
  value = module.db_subnet_rt_1.id
}

output "db_subnet_rt_2_id" {
  value = module.db_subnet_rt_2.id
}

output "public_subnet_rt_association_1_id" {
  value = module.public_subnet_rt_association_1.id
}

output "public_subnet_rt_association_2_id" {
  value = module.public_subnet_rt_association_2.id
}

output "app_subnet_rt_association_1_id" {
  value = module.app_subnet_rt_association_1.id
}

output "app_subnet_rt_association_2_id" {
  value = module.app_subnet_rt_association_2.id
}

output "db_subnet_rt_association_1_id" {
  value = module.db_subnet_rt_association_1.id
}

output "db_subnet_rt_association_2_id" {
  value = module.db_subnet_rt_association_2.id
}

output "vpc_igw_id" {
  value = module.igw.id
}

output "nat_gw_eip_1_public_ip" {
  value = module.nat_gw_eip_1.public_ip
}

output "nat_gw_eip_2_public_ip" {
  value = module.nat_gw_eip_2.public_ip
}

output "nat_gw_1_id" {
  value = module.nat_gw_2.id
}  

output "nat_gw_2_id" {
  value = module.nat_gw_2.id
}

output "public_subnet_network_acl_id" {
  value = module.public_subnet_network_acl.id
}

output "app_subnet_network_acl_id" {
  value = module.app_subnet_network_acl.id
}

output "db_subnet_network_acl_id" {
  value = module.db_subnet_network_acl.id
}

output "public_subnet_network_acl_association_1_id" {
  value = module.public_subnet_network_acl_association_1.id
}

output "public_subnet_network_acl_association_2_id" {
  value = module.public_subnet_network_acl_association_2.id
}

output "app_subnet_network_acl_association_1_id" {
  value = module.app_subnet_network_acl_association_1.id
}

output "app_subnet_network_acl_association_2_id" {
  value = module.app_subnet_network_acl_association_2.id
}

output "db_subnet_network_acl_association_1_id" {
  value = module.db_subnet_network_acl_association_1.id
}

output "db_subnet_network_acl_association_2_id" {
  value = module.db_subnet_network_acl_association_2.id
}

output "vpc_s3_gateway_endpoint_id" {
  value = module.vpc_s3_gateway_endpoint.id
}

output "public_vpc_endpoint_rt_association_1_id" {
  value = module.public_vpc_endpoint_rt_association_1.id
}

output "public_vpc_endpoint_rt_association_2_id" {
  value = module.public_vpc_endpoint_rt_association_2.id
}

output "app_vpc_endpoint_rt_association_1_id" {
  value = module.app_vpc_endpoint_rt_association_1.id
}

output "app_vpc_endpoint_rt_association_2_id" {
  value = module.app_vpc_endpoint_rt_association_2.id
}

output "db_vpc_endpoint_rt_association_1_id" {
  value = module.db_vpc_endpoint_rt_association_1.id
}

output "db_vpc_endpoint_rt_association_2_id" {
  value = module.db_vpc_endpoint_rt_association_2.id
}

output "vpcflowlogs_iam_role_id_id" {
  value = module.vpcflowlogs_iam_role.id
}

output "vpcflowlogs_iam_role_arn_arn" {
  value = module.vpcflowlogs_iam_role.arn
}


output "vpcflowlogs_iam_role_policy_id" {
  value = module.vpcflowlogs_iam_role_policy.id
}

output "vpcflowlogs_cloudwatch_log_group_arn" {
  value = module.vpcflowlogs_cloudwatch_log_group.arn
}

output "vpcflowlogs_id" {
  value = module.vpcflowlogs.id
}
