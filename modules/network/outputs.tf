output "vpc_name" {
  value = aws_vpc.terraform.tags["Name"]
}

output "vpc_id" {
  value = aws_vpc.terraform.id
}

output "public_subnet_names" {
  value = aws_subnet.public_subnet[*].tags["Name"]
}

output "public_subnet_ids" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnet_names" {
  value = aws_subnet.private_subnet[*].tags["Name"]
}

output "private_subnet_ids" {
  value = aws_subnet.private_subnet[*].id
}