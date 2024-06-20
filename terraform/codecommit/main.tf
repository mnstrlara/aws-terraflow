resource "aws_codecommit_repository" "terraflow-repo" {
  repository_name = "terraflow-repo"
  default_branch  = var.repo_default_branch
  description     = "Code Repository for hosting the tf code and pipeline config files"
  kms_key_id      = var.kms_key_arn
}
