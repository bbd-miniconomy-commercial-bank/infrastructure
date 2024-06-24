resource "aws_ssm_parameter" "admin_portal_config" {
  name        = "/admin-portal/config"
  description = "Admin portal build configuration"
  type        = "SecureString"
  value       = "DEFAULT CONFIG CHANGE VALUE"
}

resource "aws_ssm_parameter" "commercial_bank_service_config" {
  name        = "/commercial-bank-service/config"
  description = "Commercial bank service configuration"
  type        = "SecureString"
  value       = "DEFAULT CONFIG CHANGE VALUE"
}