data "aws_secretsmanager_secret_version" "psd_config" {
  secret_id = "terraform/psd-config"
}
