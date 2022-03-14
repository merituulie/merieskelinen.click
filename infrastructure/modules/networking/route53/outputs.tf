output "cert_validation_record_fqdn" {
  value = [for record in aws_route53_record.cert_validation : record.fqdn]
}