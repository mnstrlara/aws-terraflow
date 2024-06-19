variable "source_repository_name" {
  type        = string
  description = "Name of the Source CodeCommit repository used by the pipeline"
  sensitive   = true
}

variable "source_repository_branch" {
  type        = string
  description = "Branch of the Source CodeCommit repository used in pipeline"
  sensitive   = true
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}
