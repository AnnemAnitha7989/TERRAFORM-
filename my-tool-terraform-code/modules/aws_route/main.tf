resource "aws_route" "deploy_peering_route_table" {
  route_table_id            = var.deploy_peering_route_table_table_id
  destination_cidr_block    = var.deploy_peering_route_table_destination_cidr_block
  vpc_peering_connection_id = var.deploy_peering_route_table_vpc_peering_connection_id
}