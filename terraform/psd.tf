# Declares an instance, per environment, of the Product Safety Database (PSD) module.
# See: ./modules/psd for infrastructure specific to that service.

# TODO: Once the existing infrastructure is managed by Terraform, this can be
#   moved to Terraform workspaces, rather than explicit declarations per environment.

locals {
  psd_config = jsondecode(
    data.aws_secretsmanager_secret_version.psd_config.secret_string
  )
}

module "psd_prod" {
  source = "./modules/psd"

  iam_user_name                               = local.psd_config.prod.iam_user_name
  user_uploads_bucket_name                    = local.psd_config.prod.user_uploads_bucket_name
  extract_files_bucket_name                   = local.psd_config.prod.extract_files_bucket_name
  extract_database_dumps_bucket_name          = local.psd_config.prod.extract_database_dumps_bucket_name
  extract_batch_operations_role_name          = local.psd_config.prod.extract_batch_operations_role_name
  extract_batch_operation_trigger_policy_name = local.psd_config.prod.extract_batch_operation_trigger_policy_name
  extract_batch_operations_policy_name        = local.psd_config.prod.extract_batch_operations_policy_name
  manage_user_upload_bucket_policy_name       = local.psd_config.prod.manage_user_upload_bucket_policy_name
}

module "psd_staging" {
  source = "./modules/psd"

  iam_user_name                               = local.psd_config.staging.iam_user_name
  user_uploads_bucket_name                    = local.psd_config.staging.user_uploads_bucket_name
  extract_files_bucket_name                   = local.psd_config.staging.extract_files_bucket_name
  extract_database_dumps_bucket_name          = local.psd_config.staging.extract_database_dumps_bucket_name
  extract_batch_operations_role_name          = local.psd_config.staging.extract_batch_operations_role_name
  extract_batch_operation_trigger_policy_name = local.psd_config.staging.extract_batch_operation_trigger_policy_name
  extract_batch_operations_policy_name        = local.psd_config.staging.extract_batch_operations_policy_name
  manage_user_upload_bucket_policy_name       = local.psd_config.staging.manage_user_upload_bucket_policy_name
}
