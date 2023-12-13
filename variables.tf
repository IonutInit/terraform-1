variable "vpc_name" {
  type        = string
  description = "VPC name"
  default     = "terraform-project"
}

variable "custom_ingress_ports" {
  type        = list(string)
  description = "List of ports for which ingress security rules are being created"
  default     = []
}

variable "dynamodb_user" {
  type        = string
  description = "DynamoDb username"
  default     = "mr_dynamo"
}
