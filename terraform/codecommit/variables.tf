variable "create_new_repo" {
  type        = bool
  description = "Flag for deciding if a new repository needs to be created"
  default     = false
}

variable "repo_default_branch" {
  description = "The name of the default repository branch (default: master)"
  default     = "master"
}

variable "source_repository_name" {
  type        = string
  description = "Name of the Source CodeCommit repository used by the pipeline"
  sensitive   = true
}

variable "kms_key_arn" {
  description = "ARN of KMS key for encryption"
  type        = string
}
