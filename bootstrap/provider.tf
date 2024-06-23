provider "aws" {
  region = "eu-west-1"
  default_tags {
    tags = {
      "owner"         = "ryan.trickett@bbd.co.za"
      "created-using" = "terraform"
    }
  }
}