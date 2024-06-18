output "alias" {
  value       = aws_kms_key.tf-key
  description = "The Alias of the KMS key"
}

output "arn" {
  value       = aws_kms_key.tf-key.arn
  description = "The ARN of the KMS key"
}