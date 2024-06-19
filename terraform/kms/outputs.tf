output "alias" {
  value       = aws_kms_key.terraflow-key
  description = "The Alias of the KMS key"
}

output "arn" {
  value       = aws_kms_key.terraflow-key.arn
  description = "The ARN of the KMS key"
}
