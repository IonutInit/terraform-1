resource "aws_lb_target_group" "service_target_group" {
  count = length([for s in var.services : s if coalesce(s.instance_count, 1) > 1])

  name             = "${var.services[count.index].name}-target-group"
  port             = var.listener_port
  protocol         = "HTTP"
  vpc_id           = var.vpc_id
  protocol_version = "HTTP1"

  health_check {
    enabled  = true
    path     = "/health-check"
    protocol = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "service_tg_attachment" {
  count = length([for s in var.services : s if coalesce(s.instance_count, 1) > 1])

  target_group_arn = aws_lb_target_group.service_target_group[count.index].arn
  target_id        = aws_instance.web[count.index].id

  depends_on = [aws_lb_listener.service_listener]
}
