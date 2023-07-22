terraform {
  required_version = "~> 1.5.2"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0, <=5.6.2"
    }
  }

  backend "s3" {
    bucket         = "tf-backend-bucket-230708"
    key            = "w03_06/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  alias   = "region_1"
  region  = var.region_1
  profile = var.account_profile
}

provider "aws" {
  alias   = "region_2"
  region  = var.region_2
  profile = var.account_profile
}