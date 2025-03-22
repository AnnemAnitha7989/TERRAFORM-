# vpc

variable "vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}

variable "vpc_instance_tenancy" {
  type = string
  default = "default"
}

variable "vpc_tags_name" {
  type = string
  default = "deploy"
}

# internet gateway

variable "igw_tag_name" {
  type = string
  default = "deploy-igw"
}

# elastic ip address

variable "elasticip_domain" {
  type = string
  default = "vpc"
}

variable "elasticip_tag_name" {
  type = string
  default = "deploy-elasticip"
}

# nat gateway

variable "nat_gateway_tag_name" {
  type = string
  default = "deploy-nat-gateway"
}




# peering connection

variable "peer_owner_id" {
  type = string
  default = "127214193754"
}

variable "peer_vpc_id" {
  type = string
  default = "vpc-0678d20b56f68eb5e"
}

variable "peer_auto_accept" {
  type = bool
  default = true
}

variable "peer_tag_name" {
  type = string
  default = "deploy-peering"
}

# peering for private1 route table

variable "peering_private1_cidr_block" {
  type = string
  default = "172.31.0.0/16"
}

# peering for private2 route table
variable "peering_private2_cidr_block" {
  type = string
  default = "172.31.0.0/16"
}

# peering for default route table

variable "peering_default_table_id" {
  type = string
  default = "rtb-040724cce6e4b09ab"
}

variable "peering_default_cidr_block" {
  type = string
  default = "10.0.0.0/16"
}


# private1 instance

variable "private1_instance_ami_id" {
  type = string
  default = "ami-0884d2865dbe9de4b"
}

variable "private1_instance_instance_type" {
  type = string
  default = "t3.medium"
}

variable "private1_instance_device_index" {
  type = number
  default = 0
}

variable "private1_instance_key_name" {
  type = string
  default = "key_01"
}

variable "private1_instance_tags_name" {
  type = string
  default = "Elasticsearch_01"
}

#  private1 network interface 

variable "interface_private1_tag_name" {
  type = string
  default = "deploy_private1_network_interface"
}

# private1 security group 

variable "sg_private1_name" {
  type = string
  default = "web-server-sg-private1-tf"
}

variable "sg_private1_description" {
  type = string
  default = "Allow HTTPS to web server"
}




# private2 instance

variable "private2_instance_ami_id" {
  type = string
  default = "ami-0884d2865dbe9de4b"
}

variable "private2_instance_instance_type" {
  type = string
  default = "t3.medium"
}

variable "private2_instance_device_index" {
  type = number
  default = 0
}

variable "private2_instance_key_name" {
  type = string
  default = "key_01"
}

variable "private2_instance_tags_name" {
  type = string
  default = "Elasticsearch_02"
}

#  private2 network interface 

variable "interface_private2_tag_name" {
  type = string
  default = "deploy_private2_network_interface"
}

# private1 security group 

variable "sg_private2_name" {
  type = string
  default = "web-server-sg-private2-tf"
}

variable "sg_private2_description" {
  type = string
  default = "Allow HTTPS to web server"
}


# route table public

variable "rt_public_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}

variable "rt_public_tag_name" {
  type = string
  default = "public-route"
}

# route table private1

variable "rt_private1_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}

variable "rt_private1_tag_name" {
  type = string
  default = "private1-route"
}

# route table private2

variable "rt_private2_cidr_block" {
  type = string
  default = "0.0.0.0/0"
}

variable "rt_private2_tag_name" {
  type = string
  default = "private2-route"
}

# public1 subnet

variable "public1_cidr_block" {
  type = string
  default = "10.0.2.0/24"
}

variable "public1_tag_name" {
  type = string
  default = "public1-subnet"
}


variable "public1_availability_zone" {
  type = string
  default = "us-east-2a"
}


variable "public1_public_ip_on_launch" {
  type = bool
  default = true
}

# public2 subnet


variable "public2_cidr_block" {
  type = string
  default = "10.0.3.0/24"
}

variable "public2_tag_name" {
  type = string
  default = "public2-subnet"
}


variable "public2_availability_zone" {
  type = string
  default = "us-east-2b"
}


variable "public2_public_ip_on_launch" {
  type = bool
  default = true
}

# private1 subnet

variable "private1_cidr_block" {
  type = string
  default = "10.0.0.0/24"
}

variable "private1_tag_name" {
  type = string
  default = "private1"
}


variable "private1_availability_zone" {
  type = string
  default = "us-east-2a"
}


variable "private1_public_ip_on_launch" {
  type = bool
  default = false
}


# private2 subnet

variable "private2_cidr_block" {
  type = string
  default = "10.0.1.0/24"
}

variable "private2_tag_name" {
  type = string
  default = "private2"
}


variable "private2_availability_zone" {
  type = string
  default = "us-east-2b"
}


variable "private2_public_ip_on_launch" {
  type = bool
  default = false
}


# target group

variable "lb_target_group_name" {
  type = string
  default = "tf-target-group"
}

variable "lb_target_group_port" {
  type = number
  default = 9200
}

variable "lb_target_group_protocol" {
  type = string
  default = "HTTP"
}





# target group attachment private1

variable "tg_attachment_private1_port" {
  type = number
  default = 9200
}


# target group attachment private2

variable "tg_attachment_private2_port" {
  type = number
  default = 9200
}

# application lb

variable "lb_name" {
  type = string
  default = "test-lb-tf"
}

variable "lb_internal" {
  type = bool
  default = false
}

variable "lb_type" {
  type = string
  default = "application"
}


# lb listener

variable "lb_listener_port" {
  type = string
  default = "80"
}

variable "lb_listener_protocol" {
  type = string
  default = "HTTP"
}


variable "lb_listener_forward" {
  type = string
  default = "forward"
}

