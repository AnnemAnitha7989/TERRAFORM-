output "elastic_ip_id" {
  description = "The ID of the Elastic IP"
  value       = aws_eip.deploy_elasticip.id
}

output "elastic_ip_address" {
  description = "The public IP address of the Elastic IP"
  value       = aws_eip.deploy_elasticip.public_ip
}
