variable "environment" {
  type        = string
  description = "Environment where route53 is deployed"
}

variable "domain" {
  type        = string
  description = "Domain for the public site"
}

variable "region" {
  type        = string
  description = "AWS Region"
}