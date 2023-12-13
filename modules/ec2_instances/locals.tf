locals {
  instances = flatten([
    for service in var.services : [
      for index in range(coalesce(service.instance_count, 1)) : {
        instance_type = service.instance_type != null ? service.instance_type : "t2.micro"
        key_name      = coalesce(service.key_name, var.key_name)
        subnet_id     = element(var.subnet_id, index % length(var.subnet_id))
        name          = service.name
        index         = index
      }
    ]
  ])

  service_index_map = { for i, s in var.services : s.name => i }

  service_to_target_group_map = {
    for s in var.services : s.name => can(aws_lb_target_group.service_target_group[local.service_index_map[s.name]] ? aws_lb_target_group.service_target_group[local.service_index_map[s.name]].arn : null)
  }
}
