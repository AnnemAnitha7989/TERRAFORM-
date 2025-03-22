# configuring public route table

module "route_table_public" {
  source = "./modules/route_table"
  route_table_vpc_id = module.deploy_vpc.vpc_id
  route_table_cidr_block = var.rt_public_cidr_block
  route_table_gateway_id = module.aws_internet_gateway.internet_gateway_id
  route_table_tags_name = var.rt_public_tag_name
}

#  configuring route table for private1 subnets

module "route_table_private1" {
  source = "./modules/route_table"
  route_table_vpc_id = module.deploy_vpc.vpc_id
  route_table_cidr_block = var.rt_private1_cidr_block
  route_table_gateway_id = module.deploy_nat_gateway.nat_gateway_id
  route_table_tags_name = var.rt_private1_tag_name
}

# private2 route table

module "route_table_private2" {
  source = "./modules/route_table"
  route_table_vpc_id = module.deploy_vpc.vpc_id
  route_table_cidr_block = var.rt_private2_cidr_block
  route_table_gateway_id = module.deploy_nat_gateway.nat_gateway_id
  route_table_tags_name = var.rt_private2_tag_name
}
