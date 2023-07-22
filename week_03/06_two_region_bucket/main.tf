module "kr_bucket" {
  source = "./modules/s3"

  providers = {
    aws = aws.region_1
  }

  bucket_prefix            = var.bucket_prefix
  bucket_postfix           = "${var.bucket_postfix}-kr"
  versioning_configuration = var.versioning_configuration

  tags = var.tags
}

module "jp_bucket" {
  source = "./modules/s3"

  providers = {
    aws = aws.region_2
  }

  bucket_prefix            = var.bucket_prefix
  bucket_postfix           = "${var.bucket_postfix}-jp"
  versioning_configuration = var.versioning_configuration

  tags = var.tags
}