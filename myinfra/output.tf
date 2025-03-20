# Output Bastion Host's Public IP
output "Bastion_host_public_ip" {
  value = aws_instance.bastion_host.public_ip
}

# Output Elasticsearch Instance Private IPs
output "Elasticsearch_instance_private_ip" {
  value = aws_instance.Elastic_instance.private_ip
}

output "Elasticsearch_instance_2_private_ip" {
  value = aws_instance.Elasticsearch_instance_2.private_ip
}
