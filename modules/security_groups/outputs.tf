output "custom_ingress_security_group_names_ids" {
  value       = { for sg in aws_security_group.custom_ingress : sg.name => sg.id }
  description = "List of names and IDs for custom ingress security groups"
}

output "front_facing_security_group_name_id" {
  value = {
    name = aws_security_group.front_facing.name
    id   = aws_security_group.front_facing.id
  }
  description = "Name and ID of the front-facing security group"
}

output "ssh_security_group_name_id" {
  value = {
    name = aws_security_group.ssh_security_group.name
    id   = aws_security_group.ssh_security_group.id
  }
  description = "Name and ID of the SSH security group"
}

output "all_security_groups" {
  value = concat(
    [aws_security_group.ssh_security_group.id],
    [aws_security_group.front_facing.id],
    [for sg in aws_security_group.custom_ingress : sg.id]
  )

  description = "All security groups IDs"
}