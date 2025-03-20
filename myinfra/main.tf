provider "aws" {
  region = "us-east-2"
}

resource "aws_vpc" "Elasticsearch" {
  cidr_block = "10.10.0.0/16"
  tags = {
    Name = "Elasticsearch_VPC"
  }
}

# Subnets Configuration (Public & Private)
resource "aws_subnet" "my_subnet_01" {
  vpc_id            = aws_vpc.Elasticsearch.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "my_subnet_01"
  }
}

resource "aws_subnet" "my_subnet_02" {
  vpc_id            = aws_vpc.Elasticsearch.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "my_subnet_02"
  }
}

resource "aws_subnet" "my_subnet_03" {
  vpc_id            = aws_vpc.Elasticsearch.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "us-east-2a"
  tags = {
    Name = "Elasticsearch_my_subnet_03"
  }
}

resource "aws_subnet" "my_subnet_04" {
  vpc_id            = aws_vpc.Elasticsearch.id
  cidr_block        = "10.10.4.0/24"
  availability_zone = "us-east-2b"
  tags = {
    Name = "Elasticsearch_my_subnet_04"
  }
}

# Route Tables Configuration
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.Elasticsearch.id
  tags = {
    Name = "public"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.Elasticsearch.id
  tags = {
    Name = "private"
  }
}

resource "aws_route" "public_route" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

resource "aws_route" "private_route" {
  route_table_id         = aws_route_table.private.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gw.id
}

# Route Table Associations
resource "aws_route_table_association" "public_subnet_assoc-1" {
  subnet_id      = aws_subnet.my_subnet_01.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_subnet_assoc-2" {
  subnet_id      = aws_subnet.my_subnet_02.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_subnet_assoc-1" {
  subnet_id      = aws_subnet.my_subnet_03.id
  route_table_id = aws_route_table.private.id
}

resource "aws_route_table_association" "private_subnet_assoc-2" {
  subnet_id      = aws_subnet.my_subnet_04.id
  route_table_id = aws_route_table.private.id
}

# Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.Elasticsearch.id
  tags = {
    Name = "igw"
  }
}

# Elastic IP for NAT Gateway
resource "aws_eip" "nat_eip" {
  domain = "vpc"
}

# NAT Gateway
resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.my_subnet_01.id
  tags = {
    Name = "NAT-Gateway"
  }
}

# Security Group for Bastion Host
resource "aws_security_group" "bastion_sg" {
  vpc_id = aws_vpc.Elasticsearch.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Allow SSH from anywhere (you can restrict to a specific IP range)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "ALL"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Bastion_SG"
  }
}

data "aws_security_group" "default_sg" {
  filter {
    name   = "tag:Name"
    values = ["jenkins_server_sg"] 
  }
}

# Security Group for Elasticsearch instances (Private instances)
resource "aws_security_group" "ES_sg" {
  vpc_id = aws_vpc.Elasticsearch.id

  # Ingress rule for SSH access (port 22) from Bastion Host only
  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id] # Allow SSH only from Bastion Host
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [data.aws_security_group.default_sg.id] # Allow SSH only from jenkins server 
  }


  # Ingress rule for Elasticsearch traffic (port 9200)
  ingress {
    from_port       = 9200
    to_port         = 9200
    protocol        = "tcp"
    security_groups = [aws_security_group.bastion_sg.id] # Allow Elasticsearch traffic from Bastion
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "ALL"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "ES_SG"
  }
}


# Vpc peering

data "aws_vpc" "default_vpc" {
  default = true
}

resource "aws_vpc_peering_connection" "vpc_peering" {
  vpc_id        = data.aws_vpc.default_vpc.id    #requester
  peer_vpc_id   = aws_vpc.Elasticsearch.id   # accepter
  peer_region   = "us-east-2"       
  tags = {
    Name = "vpc-peering"
    
  }
}


resource "aws_vpc_peering_connection_accepter" "accepter" {
  vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id
  auto_accept               = true
}


###################################
# cross entry of OT RT
######################################

resource "aws_route" "ot_public_rt" {
route_table_id = aws_route_table.public.id
destination_cidr_block = "172.31.0.0/16"
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id 
}


resource "aws_route" "ot_private_rt" {
route_table_id = aws_route_table.private.id
destination_cidr_block = "172.31.0.0/16"
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id 
}


data "aws_route_table" "existing_rt" {
  filter {
    name   = "tag:Name"
    values = ["Management-rt"] # Replace with your Route Table name
  }
}

resource "aws_route" "management_public_rt" {
route_table_id = data.aws_route_table.existing_rt.id
destination_cidr_block = "10.10.0.0/16"
vpc_peering_connection_id = aws_vpc_peering_connection.vpc_peering.id 
}


# Elasticsearch EC2 Instance 1
resource "aws_instance" "Elastic_instance" {
  ami             = "ami-0884d2865dbe9de4b" # Change to your preferred AMI
  instance_type   = "t2.medium"
  subnet_id       = aws_subnet.my_subnet_03.id
  security_groups = [aws_security_group.ES_sg.id]
  key_name        = "key_01" # Your existing key pair name for SSH access
  tags = {
    Name = "Elasticsearch_Server_1"
  }
}

# Elasticsearch EC2 Instance 2
resource "aws_instance" "Elasticsearch_instance_2" {
  ami             = "ami-0884d2865dbe9de4b" # Change to your preferred AMI
  instance_type   = "t2.medium"
  subnet_id       = aws_subnet.my_subnet_04.id
  security_groups = [aws_security_group.ES_sg.id]
  key_name        = "key_01" # Your existing key pair name for SSH access
  tags = {
    Name = "Elasticsearch_Server_2"
  }
}

# Bastion Host EC2 Instance (with Public IP)
resource "aws_instance" "bastion_host" {
  ami                         = "ami-0884d2865dbe9de4b" # Ubuntu AMI (change as needed)
  instance_type               = "t2.medium"
  subnet_id                   = aws_subnet.my_subnet_01.id
  associate_public_ip_address = true # Ensure the Bastion Host has a public IP
  security_groups             = [aws_security_group.bastion_sg.id]
  key_name                    = "key_01" # Ensure this key exists in AWS
  tags = {
    Name = "Bastion_Host"
  }
}
