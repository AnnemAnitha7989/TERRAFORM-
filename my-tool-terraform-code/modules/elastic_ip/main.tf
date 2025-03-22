resource "aws_eip" "deploy_elasticip" {
  domain = var.deploy_elasticip_domain
  tags = {
    Name = var.deploy_elasticip_tags_name
  }
}
