resource "aws_lb" "service_lb" {
  count = length([for s in var.services : s if coalesce(s.instance_count, 1) > 1])

  name               = "${var.services[count.index].name}-load-balancer"
  internal           = false
  load_balancer_type = "application"

  subnets         = var.subnets
  security_groups = var.security_groups
}

resource "aws_lb_listener" "service_listener" {
  count = length([for s in var.services : s if coalesce(s.instance_count, 1) > 1])

  load_balancer_arn = aws_lb.service_lb[count.index].arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service_target_group[count.index].arn
  }
}