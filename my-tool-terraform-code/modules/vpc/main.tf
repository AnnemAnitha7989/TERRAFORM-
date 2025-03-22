resource "aws_vpc" "deploy_vpc" {
  cidr_block       = var.deploy_vpc_cidr_block
  instance_tenancy = var.deploy_vpc_instance_tenancy

  tags = {
    Name = var.deploy_vpc_tags_name
  }
}