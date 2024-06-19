output "s3_bucket_arn" {
  value       = aws_s3_bucket.terraflow-bucket.arn
  description = "The ARN of the S3 Bucket"
}

output "s3_bucket_name" {
  value       = aws_s3_bucket.terraflow-bucket.bucket
  description = "The Name of the S3 Bucket"
}

output "bucket_url" {
  value       = "https://s3.console.aws.amazon.com/s3/buckets/${aws_s3_bucket.terraflow-bucket.bucket}?region=${aws_s3_bucket.terraflow-bucket.region}&tab=objects"
  description = "The URL of the S3 Bucket"
}
