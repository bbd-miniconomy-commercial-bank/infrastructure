terraform {
  backend "s3" {
    bucket         = "625366111301-state"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "625366111301-state"
  }
}