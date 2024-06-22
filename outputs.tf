# outputs.tf
output "s3_arn" {
  value       = module.s3-terraflow-bucket.arn
  description = "The ARN of the S3 Bucket"
}

output "s3_bucket_name" {
  value       = module.s3-terraflow-bucket.bucket
  description = "The Name of the S3 Bucket"
}

output "codecommit_name" {
  value       = module.terraflow-repo.repository_name
  description = "The name of the Codecommit repository"
}

output "codecommit_url" {
  value       = module.terraflow-repo.clone_url_http
  description = "The Clone URL of the Codecommit repository"
}

output "codecommit_arn" {
  value       = module.terraflow-repo.arn
  description = "The ARN of the Codecommit repository"
}

output "codebuild_name" {
  value       = module.terraflow-codebuild.name
  description = "The Name of the Codebuild Project"
}

output "codebuild_arn" {
  value       = module.terraflow-codebuild.arn
  description = "The ARN of the Codebuild Project"
}

output "kms_arn" {
  value       = module.terraflow-key.arn
  description = "The ARN of the KMS key used in the codepipeline"
}

output "iam_arn" {
  value       = module.terraflow-role.role_arn
  description = "The ARN of the IAM Role used by the CodePipeline"
}

output "codepipeline_name" {
  value       = module.terraflow-pipeline.name
  description = "The Name of the CodePipeline"
}

output "codepipeline_arn" {
  value       = module.terraflow-pipeline.arn
  description = "The ARN of the CodePipeline"
}