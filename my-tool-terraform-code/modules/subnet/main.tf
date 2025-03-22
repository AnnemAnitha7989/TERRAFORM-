resource "aws_subnet" "subnet" {
  vpc_id     =  var.subnet_vpc_id
  cidr_block = var.subnet_cidr_block

  tags = {
    Name = var.subnet_tags_name
  }

  availability_zone = var.subnet_availability_zone

  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
}