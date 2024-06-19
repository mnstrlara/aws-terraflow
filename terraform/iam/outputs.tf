output "role_name" {
  value       = var.create_new_role ? aws_iam_role.terraflow-role[0].name : data.aws_iam_role.existing-terraflow-role[0].name
  description = "The IAM Role name"
}

output "role_arn" {
  value       = var.create_new_role ? aws_iam_role.terraflow-role[0].arn : data.aws_iam_role.existing-terraflow-role[0].arn
  description = "The ARN of the IAM Role"
}
