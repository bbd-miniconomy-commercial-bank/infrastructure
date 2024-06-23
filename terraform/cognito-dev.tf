locals {
  secure_domain_dev = "http://localhost:5500/callback"
}

resource "aws_cognito_user_pool" "dev_user_pool" {
  name = "noinfluence-users-dev"

  schema {
    attribute_data_type = "String"
    name                = "email"
    required            = true
    mutable             = false
    string_attribute_constraints {
      max_length = 320
      min_length = 3
    }
  }

  alias_attributes = [ "email" ]
  auto_verified_attributes = [ "email" ]
  
  account_recovery_setting {
    recovery_mechanism {
      name = "verified_email"
      priority = 1
    }
  }

  device_configuration {
    challenge_required_on_new_device = true
    device_only_remembered_on_user_prompt = true
  }

  email_configuration {
    email_sending_account = "COGNITO_DEFAULT"
  }

  verification_message_template {
    email_subject = "Noinfluence Email Verification"
    email_message = "Thank you for signing up to Noinfluence.\n\nPlease enter the verification code below to verify you email.\n\nVerification Code: {####}"

    email_subject_by_link = "Noinfluence Email Verification"
    email_message_by_link = "Thank you for signing up to Noinfluence.\n\nPlease follow the verification link below to verify you email.\n\nVerification Link: {##Click Here##}"
  }

  mfa_configuration = "OPTIONAL"

  software_token_mfa_configuration {
    enabled = true
  }

  username_configuration {
    case_sensitive = true
  }
}

resource "aws_cognito_user_pool_client" "dev_user_pool_client" {
  name = "noinfluence-website"
  user_pool_id = resource.aws_cognito_user_pool.dev_user_pool.id

  callback_urls                        = [local.secure_domain_dev]
  default_redirect_uri                 = local.secure_domain_dev
  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["email", "openid", "profile"]
  supported_identity_providers         = ["COGNITO"]

  refresh_token_validity = 30
  access_token_validity = 1
  id_token_validity = 1

  explicit_auth_flows = [ "ALLOW_REFRESH_TOKEN_AUTH" ]

  enable_token_revocation = true

  generate_secret = true

  prevent_user_existence_errors = "ENABLED"
}

resource "aws_cognito_user_pool_domain" "dev_user_pool_domain" {
  domain = "noinfluence-dev"
  user_pool_id = aws_cognito_user_pool.dev_user_pool.id
}