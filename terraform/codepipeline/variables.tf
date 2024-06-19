variable "project_name" {
  description = "Name of the project to be prefixed to create the s3 bucket"
  type        = string
}

variable "codepipeline_role_arn" {
  description = "ARN of the codepipeline IAM role"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}

variable "s3_bucket_name" {
  description = "Name of the S3 bucket used to store the deployment artifacts"
  type        = string
}

variable "source_location" {
  description = "The location of the GitHub source"
  type        = string
  sensitive   = true
}

variable "source_repo_name" {
  description = "Source repository name of the CodeCommit repository"
  type        = string
}

variable "source_repo_branch" {
  description = "Default branch in the Source repo for which CodePipeline needs to be configured"
  type        = string
}
