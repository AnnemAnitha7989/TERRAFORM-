
module "load_balancer" {
  source = "./modules/load_balancer"
  load_balancer_name = var.lb_name
  load_balancer_internal = var.lb_internal
  load_balancer_load_balancer_type = var.lb_type
  load_balancer_security_groups = [module.security_group_private1.security_group_id]
  # load_balancer_security_groups = [ aws_security_group.web_server_sg_private1_tf.id ]
  load_balancer_subnets = [ module.subnet_public1.subnet_id, module.subnet_public2.subnet_id ]
}

module "lb_listener" {
  source = "./modules/alb_listener"
  lb_listener_load_balancer_arn = module.load_balancer.load_balancer_arn
  lb_listener_port = var.lb_listener_port
  lb_listener_protocol = var.lb_listener_protocol
  lb_listener_type = var.lb_listener_forward
  lb_listener_target_group_arn = aws_lb_target_group.deploy_tg.arn
}