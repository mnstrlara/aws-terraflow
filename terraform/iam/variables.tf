variable "project_name" {
  description = "Unique name for this project"
  type        = string
  default     = "aws-terraflow"
}

variable "create_new_role" {
  type        = bool
  description = "Flag for deciding if a new role needs to be created"
}

variable "s3_bucket_arn" {
  description = "The ARN of the S3 Bucket"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}

variable "source_repository_name" {
  type        = string
  description = "Name of the Source CodeCommit repository"
  sensitive   = true
}
