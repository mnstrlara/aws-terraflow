resource "aws_s3_bucket" "tf-bucket" {
  bucket = "tf-bucket"
}

resource "aws_s3_bucket_public_access_block" "tf-bucket-pab" {
  bucket = aws_s3_bucket.tf-bucket

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
