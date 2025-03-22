resource "aws_lb_target_group" "deploy_tg" {
  name     = var.lb_target_group_name
  port     = var.lb_target_group_port
  protocol = var.lb_target_group_protocol
  vpc_id   =  module.deploy_vpc.vpc_id
}

module "target_group_attachment_private1" {
  source = "./modules/target_group_attachment"
  target_group_attachment_target_group_arn = aws_lb_target_group.deploy_tg.arn
  target_group_attachment_target_id = module.ec2_instance_private1.instance_id
  target_group_attachment_port = var.tg_attachment_private1_port
}

module "target_group_attachment_private2" {
  source = "./modules/target_group_attachment"
  target_group_attachment_target_group_arn = aws_lb_target_group.deploy_tg.arn
  target_group_attachment_target_id = module.ec2_instance_private2.instance_id
  target_group_attachment_port = var.tg_attachment_private2_port
}