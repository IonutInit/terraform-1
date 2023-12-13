locals {
  config = jsondecode(file("config.json"))
}

module "network" {
  source = "./modules/network"

  vpc_name           = lookup(local.config, "vpc_name", var.vpc_name)
  availability_zones = local.config.availability_zones
  cidr_range         = "10.0.0.0/16"
}

module "security_groups" {
  source = "./modules/security_groups"

  vpc_id = module.network.vpc_id

  ssh_allowed_ips      = local.config.ssh_allowed_ips
  custom_ingress_ports = lookup(local.config, "vpc_name", var.custom_ingress_ports)
}

module "dynamo_db" {
  source = "./modules/dynamo_db"

  dynamodb_user = lookup(local.config, "vpc_name", var.dynamodb_user)
}

module "ec2_instances" {
  source = "./modules/ec2_instances"

  services = local.config.services
  key_name = local.config.key_name

  vpc_id          = module.network.vpc_id
  subnet_id       = module.network.public_subnet_ids
  security_groups = module.security_groups.all_security_groups
  subnets         = module.network.public_subnet_ids
}
