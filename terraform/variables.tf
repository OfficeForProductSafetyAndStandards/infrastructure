variable "aws_profile" {
  type        = string
  description = "The AWS credentials profile to use"
  default     = "beis-opss-infrastructure"
}

variable "aws_region" {
  type        = string
  description = "The AWS region within which to create regioned resources"
  default     = "eu-west-2"
}

variable "remote_state_bucket" {
  type        = string
  description = "The name of the bucket in which to store remote tfstate"
  default     = "beis-opss-infrastructure-terraform-state"
}
