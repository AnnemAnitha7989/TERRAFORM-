# public subnet

module "subnet_public1" {
  source = "./modules/subnet"
  subnet_vpc_id = module.deploy_vpc.vpc_id
  subnet_cidr_block = var.public1_cidr_block
  subnet_tags_name = var.public1_tag_name
  subnet_availability_zone = var.public1_availability_zone
  subnet_map_public_ip_on_launch = var.public1_public_ip_on_launch
}

module "subnet_public2" {
  source = "./modules/subnet"
  subnet_vpc_id = module.deploy_vpc.vpc_id
  subnet_cidr_block = var.public2_cidr_block
  subnet_tags_name = var.public2_tag_name
  subnet_availability_zone = var.public2_availability_zone
  subnet_map_public_ip_on_launch = var.public2_public_ip_on_launch
}
# private subnet

module "subnet_private1" {
  source = "./modules/subnet"
  subnet_vpc_id = module.deploy_vpc.vpc_id
  subnet_cidr_block = var.private1_cidr_block
  subnet_tags_name = var.private1_tag_name
  subnet_availability_zone = var.private1_availability_zone
  subnet_map_public_ip_on_launch = var.private1_public_ip_on_launch
}

module "subnet_private2" {
  source = "./modules/subnet"
  subnet_vpc_id = module.deploy_vpc.vpc_id
  subnet_cidr_block = var.private2_cidr_block
  subnet_tags_name = var.private2_tag_name
  subnet_availability_zone = var.private2_availability_zone
  subnet_map_public_ip_on_launch = var.private2_public_ip_on_launch
}

