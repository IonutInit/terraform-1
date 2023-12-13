resource "aws_dynamodb_table" "heating-table" {
  name           = "heating-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 20
  write_capacity = 20
  hash_key       = "hashKey"

  attribute {
    name = "hashKey"
    type = "S"
  }

  attribute {
    name = "zone"
    type = "S"
  }

  attribute {
    name = "temperature"
    type = "N"
  }


  global_secondary_index {
    name            = "hashKeyIndex"
    hash_key        = "hashKey"
    projection_type = "ALL"
    write_capacity  = 5
    read_capacity   = 5
  }

  global_secondary_index {
    name            = "zoneIndex"
    hash_key        = "zone"
    projection_type = "ALL"
    write_capacity  = 5
    read_capacity   = 5
  }

  global_secondary_index {
    name            = "temperatureIndex"
    hash_key        = "temperature"
    projection_type = "ALL"
    write_capacity  = 5
    read_capacity   = 5
  }

  tags = {
    Name       = "heating-table"
    Managed_by = "terraform"
  }
}