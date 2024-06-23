terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      "owner"         = "ryan.trickett@bbd.co.za"
      "created-using" = "terraform"
    }
  }
}

provider "aws" {
  alias  = "global"
  region = "us-east-1"
  default_tags {
    tags = {
      "owner"         = "ryan.trickett@bbd.co.za"
      "created-using" = "terraform"
    }
  }
}