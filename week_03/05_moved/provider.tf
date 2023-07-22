terraform {
  required_version = "~> 1.5.2"

  backend "s3" {
    bucket         = "tf-backend-bucket-230708"
    key            = "w03_05/terraform.tfstate"
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-locks"
  }
}