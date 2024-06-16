resource "aws_codecommit_repository" "tf-repo" {
  repository_name = var.source_repository_name
  default_branch  = var.source_repository_branch
  description = "Code Repository for hosting the tf code and pipeline config files"
  kms_key_id = aws_kms_key.tf-key
}