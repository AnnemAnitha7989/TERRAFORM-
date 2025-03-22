resource "aws_lb" "load_balancer" {
  name               = var.load_balancer_name
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_load_balancer_type
  security_groups = var.load_balancer_security_groups
  subnets            = var.load_balancer_subnets

}