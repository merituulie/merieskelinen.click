variable "environment" {
  type        = string
  description = "Environment where pipeline user is created"
}

variable "bucket_arn" {
  description = "S3 bucket arn to given deployment access"
}