resource "aws_vpc" "terraform" {
  cidr_block                       = var.cidr_range
  assign_generated_ipv6_cidr_block = true

  tags = {
    Name       = var.vpc_name
    Managed_by = "terraform"
  }
}