resource "aws_acm_certificate" "cert" {
  domain_name = var.domain
  provider = aws.us-east-1
  subject_alternative_names = ["*.${var.domain}"]
  validation_method = "DNS"
  tags = local.tags
}