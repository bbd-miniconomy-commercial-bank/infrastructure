terraform {
  backend "s3" {
    bucket         = "978251882572-state"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "978251882572-state"
  }
}