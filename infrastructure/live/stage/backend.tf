terraform {
  backend "s3" {
    bucket               = "eskelinen-state-bucket"
    key                  = "live/stage/terraform.tfstate"
    region               = "us-east-1"
    workspace_key_prefix = "eskelinen"
    dynamodb_table       = "eskelinen-state-db"
    encrypt              = true
  }
}