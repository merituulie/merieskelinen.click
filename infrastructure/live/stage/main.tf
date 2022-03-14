provider "aws" {
  region = "us-east-1"
}

module "merieskelinen" {
  source = "../../modules/services/merieskelinen"
  region = "us-east-1"
  domain = "eskelinen.click"
  environment = "stage"
}