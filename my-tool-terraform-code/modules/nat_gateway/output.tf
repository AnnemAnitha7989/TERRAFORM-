output "nat_gateway_id" {
  description = "The ID of the NAT Gateway"
  value       = aws_nat_gateway.deploy_nat_gateway.id
}

output "nat_gateway_allocation_id" {
  description = "The allocation ID of the Elastic IP associated with the NAT Gateway"
  value       = aws_nat_gateway.deploy_nat_gateway.allocation_id
}