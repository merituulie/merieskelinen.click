output "bucket_regional_domain_name" {
  value = aws_s3_bucket.bucket.bucket_regional_domain_name
}

output "bucket_arn" {
  value = aws_s3_bucket.bucket.arn
}

output "bucket_name" {
  value = aws_s3_bucket.bucket.id
}

output "hosted_zone_id" {
  value = aws_s3_bucket.bucket.hosted_zone_id
}

output "userwithaccess" {
  value = s3policy
}