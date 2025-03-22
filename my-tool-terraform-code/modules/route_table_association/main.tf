resource "aws_route_table_association" "subnet_association" {
  subnet_id      = var.subnet_association_subnet_id
  route_table_id = var.subnet_association_route_table_id
}