variable "names" {
    default = ["ravs","zamantf","armat"]
    #default = ["ranga","zamantf","armat"]
  
}

provider "aws" {
  region                   = "eu-west-2"
  shared_config_files      = ["/Users/Zamanbek_Khussainov/.aws/config"]
  shared_credentials_files = ["/Users/Zamanbek_Khussainov/.aws/credentials"]
}

resource "aws_iam_user" "iam_users" {
/*   count = length(var.names)
  name  = var.names[count.index] */
  for_each = toset(var.names)
  name=each.value
}