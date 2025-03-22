resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = var.lb_listener_load_balancer_arn
  port              = var.lb_listener_port
  protocol          = var.lb_listener_protocol
  default_action {
    type             =  var.lb_listener_type
    target_group_arn = var.lb_listener_target_group_arn
  }
}