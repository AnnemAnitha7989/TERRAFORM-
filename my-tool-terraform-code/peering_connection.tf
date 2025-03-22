# creating vpc peering conenction 

module "deploy_vpc_peering" {
  source = "./modules/peering_vpc"
  deploy_vpc_peering_peer_owner_id = var.peer_owner_id
  deploy_vpc_peering_peer_vpc_id = var.peer_vpc_id
  deploy_vpc_peering_vpc_id = module.deploy_vpc.vpc_id
  deploy_vpc_peering_auto_accept = var.peer_auto_accept
  deploy_vpc_peering_tags_name = var.peer_tag_name
}

# adding peering connection to public 

module "deploy_peering_public" {
  source = "./modules/aws_route"
  deploy_peering_route_table_table_id = module.route_table_public.route_table_id
 deploy_peering_route_table_destination_cidr_block = "172.31.0.0/16"
 deploy_peering_route_table_vpc_peering_connection_id = module.deploy_vpc_peering.vpc_peering_connection_id
}

#  peering connection for private1 subnets


module "deploy_peering_private1" {
  source = "./modules/aws_route"
  deploy_peering_route_table_table_id = module.route_table_private1.route_table_id
deploy_peering_route_table_destination_cidr_block = var.peering_private1_cidr_block
deploy_peering_route_table_vpc_peering_connection_id = module.deploy_vpc_peering.vpc_peering_connection_id
}

# peering connection for private2 subnet

module "deploy_peering_private2" {
  source = "./modules/aws_route"
  deploy_peering_route_table_table_id = module.route_table_private2.route_table_id
deploy_peering_route_table_destination_cidr_block = var.peering_private2_cidr_block
deploy_peering_route_table_vpc_peering_connection_id = module.deploy_vpc_peering.vpc_peering_connection_id

}

# adding peering to default vpc route table

module "deploy_peering_default" {
  source = "./modules/aws_route"
  deploy_peering_route_table_table_id = var.peering_default_table_id
 deploy_peering_route_table_destination_cidr_block = var.peering_default_cidr_block
 deploy_peering_route_table_vpc_peering_connection_id = module.deploy_vpc_peering.vpc_peering_connection_id

}