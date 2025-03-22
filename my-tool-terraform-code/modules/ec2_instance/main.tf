resource "aws_instance" "aws_instance" {
  ami           =  var.deploy_ec2_private1_instance_ami
  instance_type = var.deploy_ec2_private1_instance_instance_type

  network_interface {
    network_interface_id = var.deploy_ec2_private1_instance_network_interface_id
    device_index         = var.deploy_ec2_private1_instance_device_index
  }

  key_name = var.deploy_ec2_private1_instance_key_name

  tags = {
    Name = var.deploy_ec2_private1_instance_tags_name
  }
 
}
