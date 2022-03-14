resource "aws_acm_certificate_validation" "cert_validation" {
  provider = aws.us-east-1
  # The amazon name service of the certicifate to validate
  certificate_arn = var.certificate_arn
  # List of fully qualified domain names that implement the validation
  validation_record_fqdns = var.validation_record_fqdns
}