module "acmcertificate" {
  domain = var.domain
  source = "../../networking/acmcertificate"
  environment = var.environment
}

module "s3_distribution" {
  source = "../../storage/s3"
  region = var.region
  bucket_name = "${var.domain}-static-files"
  oai_arn = module.cloudfront.aws_cloudfront_origin_access_identity_oai_arn
}

module "cloudfront" {
  source = "../../networking/cloudfront"
  region = var.region
  domain = var.domain
  acm_certificate_arn = module.acmcertificate.acm_certificate_arn
}

module "route53" {
  source = "../../networking/route53"
  domain_name = var.domain
  environment = var.environment
  domain_validation_options = module.acmcertificate.domain_validation_options
  cloudfront_distribution_domain_name = module.cloudfront.domain_name
  cloudfront_distribution_hosted_zone_id = module.cloudfront.hosted_zone_id
}

module "acmcertvalidation" {
  source = "../../networking/acmcertificatevalidation"
  certificate_arn = module.acmcertificate.acm_certificate_arn
  validation_record_fqdns = module.route53.cert_validation_record_fqdn
}

module "deploy_user"{
  source        = "../../iam/pipelineuser"
  bucket_arn = module.s3_distribution.bucket_arn
  environment = var.environment
}