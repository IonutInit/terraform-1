# Network outputs
output "vpc_name" {
  value = module.network.vpc_name
}

output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_names" {
  value = module.network.public_subnet_names
}

output "public_subnet_ids" {
  value = module.network.public_subnet_ids
}

output "private_subnet_names" {
  value = module.network.private_subnet_names
}

output "private_subnet_ids" {
  value = module.network.private_subnet_ids
}


# Security groups outputs

output "custom_ingress_security_group_names_ids" {
  value = module.security_groups.custom_ingress_security_group_names_ids
}

output "front_facing_security_group_name_id" {
  value = module.security_groups.front_facing_security_group_name_id
}

output "ssh_security_group_name_id" {
  value = module.security_groups.ssh_security_group_name_id
}


# Map of public ips
output "public_ips" {
  value = module.ec2_instances.public_ips
}

# Service endpoints
output "service_endpoints" {
  value = module.ec2_instances.service_endpoints
}

# DynamoDB user credentials 

output "dynamodb_access_key" {
  value = module.dynamo_db.access_key
}

output "dynamodb_secret_key" {
  value     = module.dynamo_db.secret_key
  sensitive = true
}



