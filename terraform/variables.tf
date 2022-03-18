variable "aws_profile" {
  type = string
}

variable "aws_region" {
  type    = string
  default = "eu-west-2"
}

variable "remote_state_bucket" {
  type = string
}
