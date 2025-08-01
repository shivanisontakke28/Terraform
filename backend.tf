terraform {
  backend "s3" {
    bucket = "sontakke-shivu-xyz"
    region = "us-east-1"
    key = "shivani/terraform.tfstate"
  }
}