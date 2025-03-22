output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.deploy_vpc.id
}

# output "vpc_cidr_block" {
#   description = "The CIDR block of the VPC"
#   value       = aws_vpc.deploy_vpc.cidr_block
# }

# output "vpc_instance_tenancy" {
#   description = "The instance tenancy of the VPC"
#   value       = aws_vpc.deploy_vpc.instance_tenancy
# }

# output "vpc_name" {
#   description = "The name tag of the VPC"
#   value       = aws_vpc.deploy_vpc.tags["Name"]
# }
