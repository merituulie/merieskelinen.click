variable "domain_name" {
    description = "Domain url"
    type = string
}

variable "cloudfront_distribution_domain_name" {
    description = "Cloudfront distribution domain url"
    type = string
}

variable "cloudfront_distribution_hosted_zone_id" {
    description = "Cloudfront distribution zone"
    type = string
}

variable "environment" {
    description = "Environment for the route53"
    type = string
}

variable "domain_validation_options" {
  description = "Domain validation options used for records"
}