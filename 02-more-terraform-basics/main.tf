provider "aws" {
  region                   = "eu-west-2"
  shared_config_files      = ["/Users/Zamanbek_Khussainov/.aws/config"]
  shared_credentials_files = ["/Users/Zamanbek_Khussainov/.aws/credentials"]
}

variable "iam_username_prefix" {
  type    = string
  default = "iam_user_tf_updated"
}

resource "aws_iam_user" "iam_users" {
  count = 3
  name  = "${var.iam_usernadme_prefix}_${count.index}"
}