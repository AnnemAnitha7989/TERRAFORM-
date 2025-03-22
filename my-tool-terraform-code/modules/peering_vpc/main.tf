resource "aws_vpc_peering_connection" "deploy_vpc_peering" {
  #  owner account id
  peer_owner_id =  var.deploy_vpc_peering_peer_owner_id
  #   vpc id of another vpc , acceptor
  peer_vpc_id = var.deploy_vpc_peering_peer_vpc_id
  #   requester
  vpc_id      = var.deploy_vpc_peering_vpc_id
  auto_accept = var.deploy_vpc_peering_auto_accept

  tags = {
    Name = var.deploy_vpc_peering_tags_name
  }
}
