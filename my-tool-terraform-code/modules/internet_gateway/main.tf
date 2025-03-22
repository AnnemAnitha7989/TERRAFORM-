resource "aws_internet_gateway" "deploy_igw" {
  vpc_id = var.deploy_igw_vpc_id

  tags = {
    Name = var.deploy_igw_tags_name
  }
}