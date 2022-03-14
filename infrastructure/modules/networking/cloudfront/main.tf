resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "OAI for ${var.domain}"
}

module "s3_distribution" {
  source = "../../storage/s3"
  region = var.region
  bucket_name = "${var.domain}-static-files"
  oai_arn = aws_cloudfront_origin_access_identity.oai.iam_arn
}

# Cloudfront web distribution
resource "aws_cloudfront_distribution" "cf" {
  enabled = true
  # End point to expose to the internet
  aliases = [var.domain]
  # Set up default root object property and point to index.html
  default_root_object = "index.html"

  origin {
    # Point to the bucket original name of the website bucket
    domain_name = module.s3_distribution.bucket_regional_domain_name
    origin_id = local.s3_origin_id

    # S3 origin configuration information
    s3_origin_config {
      # Identify cloudfront resource, allow connection between cloudfront and S3 bucket
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }

  default_cache_behavior {
    allowed_methods = ["GET", "HEAD", "OPTIONS", "PUT", "PATCH", "POST", "DELETE"]
    cached_methods = ["GET", "HEAD", "OPTIONS"]
    target_origin_id = local.s3_origin_id
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      headers = []
      query_string = true

      cookies {
        forward = "all"
      }
    }
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  # SSL configuration
  viewer_certificate {
    # Name of AWS certificate manager, ensure the use of HTTPS
    acm_certificate_arn = var.acm_certificate_arn
    # How to serve HTTP requests, through service name indication
    ssl_support_method = "sni-only"
    # Minimum version of the SSL protocol to user
    minimum_protocol_version = "TLSv1"
  }

  tags = local.tags
}

resource "aws_iam_policy" "cloudfront-invalidate-paths" {
  name = "cloudfront-invalidate-paths"
  description = "Used by CI pipelines to delete cached paths"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid = "VisualEditor0",
        Effect = "Allow",
        Action = "cloudfront:CreateInvalidation",
        Resource = "*"
      }
    ]
  })
}