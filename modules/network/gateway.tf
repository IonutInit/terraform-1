resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.terraform.id

  tags = {
    Name       = "${var.vpc_name}-gateway"
    Managed_by = "terraform"
  }
}