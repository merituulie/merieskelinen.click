provider "aws" {
    region = "us-east-1"
}

resource "aws_dynamodb_table" "eskelinen-state-db" {
  name         = "eskelinen-state-db"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}