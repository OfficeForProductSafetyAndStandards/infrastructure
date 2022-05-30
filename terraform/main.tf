terraform {
  backend "s3" {
    # NOTE: This bucket is managed in remote_state.tf
    # NOTE: https://github.com/hashicorp/terraform/issues/13022
    bucket  = "beis-opss-infrastructure-terraform-state"
    key     = "tfstate"
    encrypt = true
    profile = "beis-opss-infrastructure"
    region  = "eu-west-2"
  }
}
