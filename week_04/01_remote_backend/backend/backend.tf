resource "aws_s3_bucket" "s3_backend_bucket" {
  bucket = "${var.prefix}-t101study-tfstate"
}

resource "aws_s3_bucket_versioning" "s3_backend_bucket_versioning" {
  bucket = aws_s3_bucket.s3_backend_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "s3_bucket_arn" {
  value       = aws_s3_bucket.s3_backend_bucket.arn
  description = "The ARN of the S3 bucket"
}

# resource "aws_dynamodb_table" "ddb_backend_table" {
#   name         = "terraform-locks"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"

#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }

# output "dynamodb_table_name" {
#   value       = aws_dynamodb_table.ddb_backend_table.name
#   description = "The name of the DynamoDB table"
# }