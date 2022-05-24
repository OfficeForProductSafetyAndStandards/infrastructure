variable "iam_user_name" {
  type        = string
  description = "The name of the AWS user which the PSD app runs as"
  default     = "psd-user"
  nullable    = false
  sensitive   = false
}

variable "user_uploads_bucket_name" {
  type        = string
  description = "The name of the S3 bucket which will hold user file uploads"
  default     = "psd-user-uploads"
  nullable    = false
  sensitive   = false
}

variable "extract_files_bucket_name" {
  type        = string
  description = "The name of the S3 bucket which will hold extracted file uploads"
  default     = "psd-extract-files"
  nullable    = false
  sensitive   = false
}

variable "extract_database_dumps_bucket_name" {
  type        = string
  description = "The name of the S3 bucket which will hold redacted database dumps"
  default     = "psd-database-dumps"
  nullable    = false
  sensitive   = false
}

variable "extract_batch_operations_role_name" {
  type        = string
  description = "The name of the role S3 Batch Operations will assume when copying files"
  default     = "psd-file-extract-role"
  nullable    = false
  sensitive   = false
}

variable "extract_batch_operation_trigger_policy_name" {
  type        = string
  description = "The name of the policy which permits the creation of S3 Batch Operations"
  default     = "psd-batch-operations-trigger-policy"
  nullable    = false
  sensitive   = false
}

variable "extract_batch_operations_policy_name" {
  type        = string
  description = "The name of the policy which permits the copying of objects between buckets"
  default     = "psd-batch-operations-policy"
  nullable    = false
  sensitive   = false
}

variable "report_checker_slack_webhook_url" {
  type        = string
  description = "The Slack URL to notify in the event of a failure appearing in the data extract reports"
  nullable    = false
  sensitive   = false
}
