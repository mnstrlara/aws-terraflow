variable "project_name" {
  description = "Name of the project to be prefixed to create the s3 bucket"
  type        = string
  default     = "aws-terraflow"
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}

variable "codepipeline_role_arn" {
  description = "ARN of the codepipeline IAM role"
  type        = string
}
