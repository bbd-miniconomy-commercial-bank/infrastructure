resource "aws_ssm_parameter" "admin_portal_test_config" {
  name        = "/admin-portal/ci/config"
  description = "Admin portal configuration for CI testing"
  type        = "SecureString"
  value       = "DEFAULT CONFIG CHANGE VALUE"
}

resource "aws_ssm_parameter" "commercial_bank_service_test_config" {
  name        = "/commercial-bank-service/ci/config"
  description = "Commercial bank service configuration for CI testing"
  type        = "SecureString"
  value       = "DEFAULT CONFIG CHANGE VALUE"
}

resource "aws_ssm_parameter" "admin_portal_config" {
  name        = "/admin-portal/prod/config"
  description = "Admin portal build configuration"
  type        = "SecureString"
  value       = "DEFAULT CONFIG CHANGE VALUE"
}