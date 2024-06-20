output "source_repository_name" {
  value       = aws_codecommit_repository.terraflow-repo
  description = "List containing the name of the CodeCommit repositories"
}