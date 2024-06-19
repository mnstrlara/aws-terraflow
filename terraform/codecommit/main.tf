resource "aws_codecommit_repository" "terraflow-repo" {
  repository_name = var.source_repository_name
  default_branch  = var.source_repository_branch
  description     = "Code Repository for hosting the tf code and pipeline config files"
  kms_key_id      = var.kms_key_arn
}
