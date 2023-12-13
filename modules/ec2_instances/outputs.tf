output "public_ips" {
  description = "public IPs of instances"
  value = {
    for instance in aws_instance.web :
    instance.tags["Name"] => instance.public_ip
  }
}

output "instance_ids" {
  description = "IDs of instances"
  value       = aws_instance.web.*.id
}

output "service_endpoints" {
  description = "Endpoints of services"
  value = {
    for s in var.services :
    s.name => coalesce(s.instance_count, 1) > 1 && can(aws_lb.service_lb[local.service_index_map[s.name]])
    ? aws_lb.service_lb[local.service_index_map[s.name]].dns_name
    : can(aws_instance.web[local.service_index_map[s.name]])
    ? aws_instance.web[local.service_index_map[s.name]].public_dns
    : null
  }
}
