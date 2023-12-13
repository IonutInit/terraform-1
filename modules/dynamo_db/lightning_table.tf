resource "aws_dynamodb_table" "lighting-table" {
  name           = "lighting-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "hashKey"

  attribute {
    name = "hashKey"
    type = "S"
  }

  attribute {
    name = "location"
    type = "S"
  }

  attribute {
    name = "id"
    type = "N"
  }

  attribute {
    name = "status"
    type = "B"
  }

  global_secondary_index {
    name            = "locationIndex"
    hash_key        = "location"
    projection_type = "ALL"
    write_capacity  = 5
    read_capacity   = 5
  }

  global_secondary_index {
    name            = "idIndex"
    hash_key        = "id"
    projection_type = "ALL"
    write_capacity  = 5
    read_capacity   = 5
  }

  global_secondary_index {
    name            = "statusIndex"
    hash_key        = "status"
    projection_type = "ALL"
    write_capacity  = 5
    read_capacity   = 5
  }

  tags = {
    Name       = "lighting-table"
    Managed_by = "terraform"
  }
}
