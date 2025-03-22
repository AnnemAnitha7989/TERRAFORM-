# association private subnets with private route tables 

module "subnet_association_private1" {
  source = "./modules/route_table_association"
  subnet_association_subnet_id = module.subnet_private1.subnet_id
  subnet_association_route_table_id = module.route_table_private1.route_table_id
}

module "subnet_association_private2" {
  source = "./modules/route_table_association"
  subnet_association_subnet_id = module.subnet_private2.subnet_id
  subnet_association_route_table_id = module.route_table_private2.route_table_id
}

# route table association for public subnet to public route table

module "subnet_association_public1" {
  source = "./modules/route_table_association"
  subnet_association_subnet_id = module.subnet_public1.subnet_id
  subnet_association_route_table_id = module.route_table_public.route_table_id
}

module "subnet_association_public2" {
  source = "./modules/route_table_association"
  subnet_association_subnet_id =  module.subnet_public2.subnet_id
  subnet_association_route_table_id = module.route_table_public.route_table_id
}