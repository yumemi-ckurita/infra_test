// プロバイダ - 
provider "aws" {
  region = "us-east-2"
}

terraform {
  # Versionは固定
  required_version = "= 0.12.29"
  backend "s3" {
    bucket  = "infratest-dev-terraform-tfstates"
    key     = "dev/network/terraform.tfstate"
    region  = "ap-northeast-1"
    profile = "aws-saml-login"
  }
}
