# S3 bucket
resource "aws_s3_bucket" "bucket" {
  bucket = var.bucket_name
  acl = "private"
  force_destroy = true
  tags = local.tags

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Lock down and restrict direct public access to the s3 bucket
resource "aws_s3_bucket_public_access_block" "s3websiteblock" {
  bucket = aws_s3_bucket.bucket.id
  block_public_acls = true
  ignore_public_acls = true
}

# Using origin access identity, communication setup from cloudfront to S3 bucket
resource "aws_s3_bucket_policy" "s3policy" {
  bucket = aws_s3_bucket.bucket.id

  # Permissions of the cloudfront to the s3 bucket
  policy = data.aws_iam_policy_document.s3policy.json
}