variable "names" {
  default = {
    ravs : { country : "Netherlands", department : "ABC" },
    tom : { country : "US", department : "DEF" },
    jane : { country : "India", department : "ZXC" }
  }
}

provider "aws" {
  region                   = "eu-west-2"
  shared_config_files      = ["/Users/Zamanbek_Khussainov/.aws/config"]
  shared_credentials_files = ["/Users/Zamanbek_Khussainov/.aws/credentials"]
}

resource "aws_iam_user" "iam_users" {
  for_each = var.names
  name     = each.key
  tags = {
    country : each.value.country
    department : each.value.department
  }
}