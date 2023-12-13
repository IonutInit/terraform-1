variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "cidr_range" {
  type        = string
  description = "CIDR block values"
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  type        = list(string)
  description = "Availability zones inside region"
}
