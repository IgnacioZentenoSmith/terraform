terraform {
  backend "s3" {
    bucket  = "aws_s3_bucket_name"
    key     = "dev"
    region  = "us-east-2"
    encrypt = true
    kms_key_id = "key-from-output"
  }
}

# remote state handling from s3 bucket
# create a unique IAM user who has access to this bucket -> can see without encryption