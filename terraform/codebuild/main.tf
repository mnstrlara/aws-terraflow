resource "aws_codebuild_project" "terraflow-codebuild" {
  name           = "terraflow-codebuild"
  service_role   = var.role_arn
  encryption_key = var.kms_key_arn

  artifacts {
    type           = "CODEPIPELINE"
    name           = "terraflow-artifacts"
    location       = ""
    packaging      = "ZIP"
    namespace_type = "NONE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("./buildspecs/buildspec.yml")
  }
}

resource "aws_codebuild_project" "terraflow-test-codebuild" {
  name           = "terraflow-test-codebuild"
  service_role   = var.role_arn
  encryption_key = var.kms_key_arn

  artifacts {
    type           = "CODEPIPELINE"
    name           = "terraflow-test-artifacts"
    location       = ""
    packaging      = "ZIP"
    namespace_type = "NONE"
  }

  environment {
    compute_type                = "BUILD_GENERAL1_SMALL"
    image                       = "aws/codebuild/amazonlinux2-x86_64-standard:4.0"
    type                        = "LINUX_CONTAINER"
    image_pull_credentials_type = "CODEBUILD"
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = file("./buildspecs/test-buildspec.yml")
  }
}
