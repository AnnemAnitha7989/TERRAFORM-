resource "aws_nat_gateway" "deploy_nat_gateway" {
  allocation_id = var.deploy_nat_gateway_allocation_id
  subnet_id     = var.deploy_nat_gateway_subnet_id

  tags = {
    Name = var.deploy_nat_gateway_tags_name
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPCaws_internet_gateway.
  # depends_on = var.
}