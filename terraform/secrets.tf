resource "aws_secretsmanager_secret" "service_api_key_secret" {
  for_each = { for service in local.services : service.service_name => service }

  name       = "commercial-bank/auth/${each.value.service_name}"
  description = "Secret API key for ${each.value.service_name}"
}

resource "aws_secretsmanager_secret_policy" "service_api_key_secret_policy" {
  for_each = { for service in local.services : service.service_name => service }

  secret_arn = aws_secretsmanager_secret.service_api_key_secret[each.value.service_name].arn

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Principal = {
          AWS = "arn:aws:iam::${each.value.account_id}:root"
        },
        Action   = [
          "secretsmanager:GetSecretValue"
        ],
        Resource = aws_secretsmanager_secret.service_api_key_secret[each.key].arn,
      }
    ],
  })
}

output "service_api_key_secrets_list" {
  value = [
    for secret in aws_secretsmanager_secret.service_api_key_secret :
    {
      service_secret_name = secret.name
      secret_arn   = secret.arn
    }
  ]
}