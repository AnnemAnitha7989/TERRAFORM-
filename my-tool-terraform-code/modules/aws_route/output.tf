output "route_id" {
  description = "The ID of the route"
  value       = aws_route.deploy_peering_route_table.id
}

output "route_table_id" {
  description = "The ID of the route table where the route is added"
  value       = aws_route.deploy_peering_route_table.route_table_id
}
