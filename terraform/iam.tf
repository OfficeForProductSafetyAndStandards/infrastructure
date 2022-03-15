# IAM for Terraform and the people who run it

resource "aws_iam_group" "terraformers" {
  name = "terraformers"
}

resource "aws_iam_group_policy_attachment" "terraformers" {
  for_each = toset([
    "arn:aws:iam::aws:policy/IAMFullAccess",
    "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  ])
  group      = aws_iam_group.terraformers.name
  policy_arn = each.key
}
