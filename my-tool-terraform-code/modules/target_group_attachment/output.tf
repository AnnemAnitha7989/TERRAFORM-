output "target_group_attachment" {
  description = "id of the target group"
  value = aws_lb_target_group_attachment.target_group_attachment.id
}