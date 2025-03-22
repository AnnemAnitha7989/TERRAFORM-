output "vpc_peering_connection_id" {
  description = "The ID of the VPC peering connection"
  value       = aws_vpc_peering_connection.deploy_vpc_peering.id
}

output "vpc_peering_connection_requester_vpc_id" {
  description = "The VPC ID of the requester"
  value       = aws_vpc_peering_connection.deploy_vpc_peering.vpc_id
}