terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.4.0"
    }
  }

  required_version = ">= 0.13"
}
