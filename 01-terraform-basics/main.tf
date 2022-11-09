provider "aws" {
  region = "eu-west-2"
  shared_config_files      = ["/Users/Zamanbek_Khussainov/.aws/config"]
  shared_credentials_files = ["/Users/Zamanbek_Khussainov/.aws/credentials"]
  profile                  = "default"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "zamantfbucket1"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.s3_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_iam_user" "iam_user" {
    name = "iam_user_tf_updated"

}