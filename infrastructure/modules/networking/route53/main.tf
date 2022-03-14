resource "aws_route53_zone" "domain" {
  name = var.domain_name
  tags = {
    environment = var.environment
  }
}

# Allow url to talk to cloudfront resource
resource "aws_route53_record" "cert_validation" {
  for_each = {
    for d in var.domain_validation_options : d.domain_name => {
      name   = d.resource_record_name
      record = d.resource_record_value
      type   = d.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 300
  type            = each.value.type
  zone_id         = aws_route53_zone.domain.zone_id
}

resource "aws_route53_record" "websiteurl" {
  name    = var.domain_name
  zone_id = aws_route53_zone.domain.zone_id
  type    = "A"

  alias {
    name                   = var.cloudfront_distribution_domain_name
    zone_id                = var.cloudfront_distribution_hosted_zone_id
    evaluate_target_health = true
  }
}