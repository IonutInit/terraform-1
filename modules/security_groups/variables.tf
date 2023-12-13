variable "vpc_id" {
  type        = string
  description = "VPC id"
}

variable "ssh_allowed_ips" {
  type        = list(string)
  description = "List of IPs from which SSH is allowed"
}

variable "custom_ingress_ports" {
  type        = list(string)
  description = "List of ports for which ingress security rules are being created"
}