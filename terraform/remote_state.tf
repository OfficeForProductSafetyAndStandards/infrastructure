# This is for managing the S3 bucket which contains the tfstate file.
# To see where terraform is configured to use it, look in main.tf.

resource "aws_s3_bucket" "remote_state" {
  bucket = var.remote_state_bucket
}

resource "aws_s3_bucket_server_side_encryption_configuration" "remote_state" {
  bucket = aws_s3_bucket.remote_state.id
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "remote_state" {
  bucket = aws_s3_bucket.remote_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_lifecycle_configuration" "remote_state" {
  depends_on = [aws_s3_bucket_versioning.remote_state]
  bucket     = aws_s3_bucket.remote_state.id
  rule {
    id = "Keep old versions for 30 days"
    noncurrent_version_expiration {
      noncurrent_days = 30
    }
    status = "Enabled"
  }
}
