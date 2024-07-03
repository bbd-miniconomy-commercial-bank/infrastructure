resource "aws_secretsmanager_secret" "retail_bank_secrets" {
  name = "retail-bank-service/auth/commercial-bank-service"
}

resource "aws_secretsmanager_secret" "zues_secrets" {
  name = "hoz-service/auth/commercial-bank-service"
}