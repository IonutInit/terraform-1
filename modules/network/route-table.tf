# public routes

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name       = "public-route-table"
    Managed_by = "terraform"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public_subnet)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}


# private routes

resource "aws_default_route_table" "private_route_table" {
  default_route_table_id = aws_vpc.terraform.default_route_table_id

  tags = {
    Name       = "private-route-table"
    Managed_by = "terraform"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.private_subnet)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_default_route_table.private_route_table.id
}