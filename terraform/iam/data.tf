data "aws_region" "current" {}
data "aws_caller_identity" "current" {}
data "aws_partition" "current" {}

data "aws_iam_role" "existing-terraflow-role" {
  count = var.create_new_role ? 0 : 1
  name  = "terraflow-role"
}
