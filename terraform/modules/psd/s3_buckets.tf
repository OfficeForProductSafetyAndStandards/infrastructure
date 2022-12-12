resource "aws_s3_bucket" "extract_files" {
  bucket        = var.extract_files_bucket_name
  force_destroy = "false"
}

resource "aws_s3_bucket" "extract_database_dumps" {
  bucket        = var.extract_database_dumps_bucket_name
  force_destroy = "false"
}

resource "aws_s3_bucket" "user_uploads" {
  bucket = var.user_uploads_bucket_name
  force_destroy = "false"
}
