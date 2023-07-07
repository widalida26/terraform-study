resource "aws_s3_bucket" "backend_bucket" {
    bucket = "${var.prefix}-bucket-${var.postfix}"
}

resource "aws_s3_bucket_versioning" "name" {
    bucket = aws_s3_bucket.backend_bucket.id

    versioning_configuration {
        status = "Enabled"
    }
}

resource "aws_dynamodb_table" "backend_table" {
  name = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}