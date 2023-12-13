variable "vpc_id" {
  type        = string
  description = "vpc id"
}

variable "subnet_id" {
  type        = list(string)
  description = "list of subnet ids for ec2 instances"
}

variable "security_groups" {
  type        = list(string)
  description = "list of security groups of ec2 instances"
}

variable "key_name" {
  type        = string
  description = "key pair name for ec2 instances"
}

variable "subnets" {
  type = list(string)
}

variable "listener_port" {
  type    = number
  default = 3000
}

variable "services" {
  description = "List of services neededing EC2 instances"

  type = list(object({
    name : string
    instance_count : optional(number)
    instance_type : optional(string)
    key_name : optional(string)
  }))
}