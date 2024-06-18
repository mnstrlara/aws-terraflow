resource "aws_codebuild_project" "tf-codebuild" {
  name = "tf-codebuild"
  service_role = var.role_arn
  encryption_key = var.kms_key_arn
  
  artifacts {
    type = "S3"
  }

  cache {
    type = "S3"
    location = var.s3_bucket_name
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type = "GITHUB"
    location = var.source_location
    git_clone_depth = 1
  }
}