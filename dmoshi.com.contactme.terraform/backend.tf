terraform {
  backend "s3" {
    bucket = "www.dmoshi.com"
    key =   "terraform_state"
    region = "us-east-1"
  }
}