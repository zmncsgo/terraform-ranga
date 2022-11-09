output "s3_bucket_versioning" {
    value = aws_s3_bucket.s3_bucket.versioning[0].enabled
}

output "s3_bucket_complete_details" {
    value = aws_s3_bucket.s3_bucket
}

output "my_iamuser_complete_details" {
    value = aws_iam_user.iam_user
}