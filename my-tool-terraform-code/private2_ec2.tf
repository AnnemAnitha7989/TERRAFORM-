# private1 ec2 instance

module "ec2_instance_private2" {
  source = "./modules/ec2_instance"
  deploy_ec2_private1_instance_ami = var.private2_instance_ami_id
  deploy_ec2_private1_instance_instance_type = var.private2_instance_instance_type
  deploy_ec2_private1_instance_network_interface_id = module.network_interface_private2.network_interface_id
  deploy_ec2_private1_instance_device_index = var.private2_instance_device_index
  deploy_ec2_private1_instance_key_name = var.private2_instance_key_name
  deploy_ec2_private1_instance_tags_name = var.private2_instance_tags_name
}

# network interface

module "network_interface_private2" {
  source = "./modules/network_interface"
  network_interface_subnet_id = module.subnet_private2.subnet_id
  network_interface_security_groups = [module.security_group_private2.security_group_id]
  # network_interface_security_groups = [ aws_security_group.web_server_sg_private2_tf.id]
  network_interface_tags_Name = var.interface_private2_tag_name
}

# instance in public subnet
# resource "aws_security_group" "web_server_sg_private2_tf" {
#   name        = "web-server-sg-private2-tf"
#   description = "Allow HTTPS to web server"
#   vpc_id      =  module.deploy_vpc.vpc_id

#     ingress {
#     description = "ssh ingress"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Kibana ingress"
#     from_port   = 5601
#     to_port     = 5601
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Elastic ingress"
#     from_port   = 9200
#     to_port     = 9200
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "Elastic ingress"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "All traffic ingress"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }


#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }

module "security_group_private2" {
  source = "./modules/security_group"
  security_group_name = var.sg_private2_name
  security_group_description = var.sg_private2_description
  security_group_vpc_id = module.deploy_vpc.vpc_id
  ingress_rules = [
    {
      description = "ssh ingress"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      description = "kibana ingress"
      from_port = 5601
      to_port = 5601
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
    description = "All traffic ingress"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

  ]

   egress_from_port = 0
   egress_to_port = 0
   egress_protocol = "-1"
   egress_cidr_block = ["0.0.0.0/0"]

}