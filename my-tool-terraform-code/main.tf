provider "aws" {
  region = "us-east-2"
}

# vpc

module "deploy_vpc" {
  source = "./modules/vpc"
  deploy_vpc_cidr_block = var.vpc_cidr_block
  deploy_vpc_instance_tenancy = var.vpc_instance_tenancy
  deploy_vpc_tags_name = var.vpc_tags_name
}


# internet gateway

module "aws_internet_gateway" {
  source = "./modules/internet_gateway"
  deploy_igw_vpc_id = module.deploy_vpc.vpc_id
  deploy_igw_tags_name= var.igw_tag_name
}

# elastic ip address

module "deploy_elasticip" {
  source = "./modules/elastic_ip"
  deploy_elasticip_domain = var.elasticip_domain
  deploy_elasticip_tags_name = var.elasticip_tag_name

}

# nat gateway

module "deploy_nat_gateway" {
  source = "./modules/nat_gateway"
  deploy_nat_gateway_allocation_id = module.deploy_elasticip.elastic_ip_id
  deploy_nat_gateway_subnet_id = module.subnet_public1.subnet_id
  deploy_nat_gateway_tags_name = var.nat_gateway_tag_name
  # we dont need to define depends_on in module resource block , we can directly put it here only
  depends_on = [  module.aws_internet_gateway.nat_gateway_id]
}

# data block for already created vpc

data "aws_vpc" "selected" {
  id = "vpc-0678d20b56f68eb5e"
}








