resource "aws_iam_role" "extract_batch_operations" {
  assume_role_policy = <<POLICY
{
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Effect": "Allow",
      "Principal": {
        "Service": "batchoperations.s3.amazonaws.com"
      }
    }
  ],
  "Version": "2012-10-17"
}
POLICY

  description          = "Used by S3 Batch Operations to copy files extracted files from ${aws_s3_bucket.user_uploads.id} to the ${aws_s3_bucket.extract_files.id} S3 buckets"
  max_session_duration = "3600"
  name                 = var.extract_batch_operations_role_name
  path                 = "/"
}

resource "aws_iam_policy" "extract_batch_operations" {
  description = "Allows objects to be copied from the ${aws_s3_bucket.user_uploads.id} to the ${aws_s3_bucket.extract_files.id} S3 buckets by the role S3 Batch Operations assumes"
  name        = var.extract_batch_operations_policy_name
  path        = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.user_uploads.arn}/*",
      "Sid": "VisualEditor0"
    },
    {
      "Action": "s3:PutObject",
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.extract_files.arn}/*",
      "Sid": "VisualEditor1"
    },
    {
      "Action": "s3:GetObject",
      "Effect": "Allow",
      "Resource": "${aws_s3_bucket.extract_files.arn}/manifests/*",
      "Sid": "VisualEditor2"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_role_policy_attachment" "extract_batch_operations" {
  policy_arn = aws_iam_policy.extract_batch_operations.arn
  role       = aws_iam_role.extract_batch_operations.name
}


resource "aws_iam_policy" "extract_batch_operation_trigger" {
  name = var.extract_batch_operation_trigger_policy_name
  path = "/"

  policy = <<POLICY
{
  "Statement": [
    {
      "Action": [
        "s3:PutObject",
        "iam:PassRole"
      ],
      "Effect": "Allow",
      "Resource": [
        "${aws_s3_bucket.extract_files.arn}/*",
        "${aws_iam_role.extract_batch_operations.arn}"
      ],
      "Sid": "VisualEditor0"
    },
    {
      "Action": "s3:CreateJob",
      "Effect": "Allow",
      "Resource": "*",
      "Sid": "VisualEditor1"
    }
  ],
  "Version": "2012-10-17"
}
POLICY
}

resource "aws_iam_user_policy_attachment" "extract_batch_operation_trigger" {
  policy_arn = aws_iam_policy.extract_batch_operation_trigger.arn
  user       = aws_iam_user.iam_user.name
}

resource "aws_iam_policy" "manage_user_upload_bucket_policy" {
  name = var.manage_user_upload_bucket_policy_name
  path = "/"

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "VisualEditor0",
          "Effect": "Allow",
          "Action": [
              "s3:PutObject",
              "s3:GetObject",
              "s3:ListBucket",
              "s3:DeleteObject"
          ],
          "Resource": [
              "${aws_s3_bucket.user_uploads.arn}/*",
              "${aws_s3_bucket.user_uploads.arn}"
          ]
      }
  ]
}
  POLICY
}

resource "aws_iam_user" "iam_user" {
  name = var.iam_user_name
}

resource "aws_iam_user_policy_attachment" "manage_user_upload_bucket_policy" {
  user       = aws_iam_user.iam_user.name
  policy_arn = aws_iam_policy.manage_user_upload_bucket_policy.arn
}
