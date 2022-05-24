data "aws_iam_user" "iam_user" {
  user_name = var.iam_user_name
}

data "aws_s3_bucket" "user_uploads" {
  bucket = var.user_uploads_bucket_name
}
