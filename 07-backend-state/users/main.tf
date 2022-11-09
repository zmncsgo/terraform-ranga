terraform {
  backend "s3"{
    bucket = "dev-applications-backend-state-zaman-project"
    key = "dev/07-backend-state/users/backend-state"
    region = "eu-west-2"
    dynamodb_table = "dev_application_locks"
    encrypt = true
  }
}

provider "aws" {
  region = "eu-west-2"
  shared_config_files      = ["/Users/Zamanbek_Khussainov/.aws/config"]
  shared_credentials_files = ["/Users/Zamanbek_Khussainov/.aws/credentials"]
  profile                  = "default"
}



resource "aws_iam_user" "iam_user" {
    name = "${terraform.workspace}_iam_user_tf"
}
