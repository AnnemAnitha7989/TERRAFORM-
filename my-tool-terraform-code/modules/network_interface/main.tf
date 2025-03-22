resource "aws_network_interface" "network_interface" {
  subnet_id = var.network_interface_subnet_id
  #   private_ips = ["172.16.10.100"]
  security_groups = var.network_interface_security_groups
  tags = {
    Name = var.network_interface_tags_Name
  }
}