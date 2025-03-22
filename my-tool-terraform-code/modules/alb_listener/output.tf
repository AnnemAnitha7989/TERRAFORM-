output "lb_listener_id" {
  description = "id of the load balancer listener"
  value = aws_lb_listener.lb_listener.id
}