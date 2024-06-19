resource "aws_s3_bucket" "terraflow-bucket" {
  bucket = "terraflow-bucket"
}

resource "aws_s3_bucket_public_access_block" "terraflow-bucket-pab" {
  bucket = "terraflow-bucket"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
