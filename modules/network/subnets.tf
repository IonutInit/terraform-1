# public subnets

resource "aws_subnet" "public_subnet" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = format("10.0.%d.0/20", count.index * 16)
  ipv6_cidr_block   = cidrsubnet(aws_vpc.terraform.ipv6_cidr_block, 8, count.index)
  availability_zone = var.availability_zones[count.index]

  map_public_ip_on_launch = true

  tags = {
    Name       = "${var.vpc_name}-public-${count.index + 1}"
    Managed_by = "terraform"
  }
}


# private subnets

resource "aws_subnet" "private_subnet" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.terraform.id
  cidr_block        = format("10.0.%d.0/20", count.index * 16 + 128)
  ipv6_cidr_block   = cidrsubnet(aws_vpc.terraform.ipv6_cidr_block, 8, count.index + length(var.availability_zones))
  availability_zone = var.availability_zones[count.index]

  tags = {
    Name       = "${var.vpc_name}-private-${count.index + 1}"
    Managed_by = "terraform"
  }
}