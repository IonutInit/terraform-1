resource "aws_security_group" "custom_ingress" {
  for_each = toset(var.custom_ingress_ports)

  name        = "ingress_port_${each.key}-nc"
  description = "security group for port ${each.key}"
  vpc_id      = var.vpc_id

  tags = {
    Name       = "ingress_port_${each.key}"
    Managed_by = "terraform"
  }

  ingress {
    description      = "Ingress rule for port ${each.key}"
    from_port        = each.key
    to_port          = each.key
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}