output "domain_name" {
  value = aws_cloudfront_distribution.cf.domain_name
}

output "hosted_zone_id" {
  value = aws_cloudfront_distribution.cf.hosted_zone_id
}

output "cloudfront_s3_bucket_arn" {
  value = module.s3_distribution.bucket_arn
}

output "cloudfront_arn" {
  value = aws_cloudfront_distribution.cf.arn
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.cf.id
}

output "aws_cloudfront_origin_access_identity_oai_arn" {
    value = aws_cloudfront_origin_access_identity.oai.iam_arn
}