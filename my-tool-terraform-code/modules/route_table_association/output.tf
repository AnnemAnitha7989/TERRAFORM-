output "subnet_association_id" {
  description = "The ID of the subnet connection"
  value       = aws_route_table_association.subnet_association.id
}

