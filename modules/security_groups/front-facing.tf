resource "aws_security_group" "front_facing" {
  name        = "front_facing-nc"
  description = "HTTP/HTTPS oubound rule"
  vpc_id      = var.vpc_id

  tags = {
    Name       = "http_front_facing-nc"
    Managed_by = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http_ipv6" {
  description = "HTTP connection for ipv6"

  security_group_id = aws_security_group.front_facing.id

  cidr_ipv6 = "::/0"
  # cidr_ipv6 = "::1/128" # loopback address blocking external traffic
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80

  tags = {
    Name       = "IPv6-nc"
    Managed_by = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "http_ipv4" {
  description = "HTTP connection for ipv4"

  security_group_id = aws_security_group.front_facing.id

  cidr_ipv4 = "0.0.0.0/0"
  # cidr_ipv4 = "127.0.0.1/32" # loopback address blocking external traffic
  from_port   = 80
  ip_protocol = "tcp"
  to_port     = 80

  tags = {
    Name       = "IPv4-nc"
    Managed_by = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "https_ipv6" {
  description = "secure HTTPS connection for ipv6"

  security_group_id = aws_security_group.front_facing.id

  cidr_ipv6   = "::/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443

  tags = {
    Name       = "secure-IPv6-nc"
    Managed_by = "terraform"
  }
}

resource "aws_vpc_security_group_ingress_rule" "https_ipv4" {
  description = "secure HTTPS connection for ipv4"

  security_group_id = aws_security_group.front_facing.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 443
  ip_protocol = "tcp"
  to_port     = 443

  tags = {
    Name       = "secure-IPv4-nc"
    Managed_by = "terraform"
  }
}


resource "aws_vpc_security_group_egress_rule" "outgoing_ipv6" {
  description = "accepting all outbound traffic on ipv6"

  security_group_id = aws_security_group.front_facing.id

  cidr_ipv6   = "::/0"
  ip_protocol = "-1"

  tags = {
    Name       = "all-traffic-ipv6-nc"
    Managed_by = "terraform"
  }
}

resource "aws_vpc_security_group_egress_rule" "outgoing_ipv4" {
  description = "accepting all outbound traffic on ipv4"

  security_group_id = aws_security_group.front_facing.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1"

  tags = {
    Name       = "all-traffic-ipv4-nc"
    Managed_by = "terraform"
  }
}