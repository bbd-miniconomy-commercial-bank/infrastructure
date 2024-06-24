resource "aws_acm_certificate" "https_frontend_cert" {
  domain_name = local.domain
  validation_method = "DNS"
  provider = aws.global
}

resource "aws_acm_certificate" "https_api_cert" {
  domain_name = "api.${local.domain}"
  validation_method = "DNS"
}