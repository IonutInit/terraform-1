resource "aws_security_group" "ssh_security_group" {
  name        = "ssh-nc"
  description = "Security group for SSH"
  vpc_id      = var.vpc_id

  tags = {
    Name       = "SSH"
    Managed_by = "terraform"
  }

  dynamic "ingress" {
    for_each = var.ssh_allowed_ips
    content {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = [ingress.value]
    }
  }
}