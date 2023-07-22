resource "aws_s3_bucket" "bucket" {
  # provider = var.pvd

  bucket = "${var.bucket_prefix}-bucket-${var.bucket_postfix}"

  tags = var.tags
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}