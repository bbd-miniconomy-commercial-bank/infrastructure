resource "aws_secretsmanager_secret" "retail_bank_secrets" {
  name = "retail-bank-service/auth/commercial-bank-service"
}