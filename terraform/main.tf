terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4.0"
    }
  }

  required_version = ">= 0.13"

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

provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
  default_tags {
    tags = {
      ManagedBy          = "Terraform"
      TerraformRepo      = "UKGovernmentBEIS/beis-opss-infrastructure"
      TerraformWorkspace = terraform.workspace
    }
  }
}
