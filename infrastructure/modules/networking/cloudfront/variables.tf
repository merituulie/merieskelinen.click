variable "domain" {
    description = "Domain url"
    type = string
}

variable "region" {
    description = "AWS region"
    type = string
}

variable "acm_certificate_arn" {
  type        = string
  description = "The ARN of the AWS Certificate Manager certificate that you wish to use with this distribution"
}


variable "allowed_actions" {
  type        = list(string)
  description = "Actions that are allowed for bucket"
  default     = []
}