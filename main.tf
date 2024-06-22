terraform {
  required_version = ">= 1.8.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.20.1"
    }
  }

}

module "s3-terraflow-bucket" {
  source                = "./terraform/s3"
  project_name          = var.project_name
  kms_key_arn           = module.terraflow-key.arn
  codepipeline_role_arn = module.terraflow-role.role_arn
}

module "terraflow-repo" {
  source                 = "./terraform/codecommit"
  source_repository_name = var.source_repository_name
  kms_key_arn            = module.terraflow-key.arn
}

module "terraflow-codebuild" {
  depends_on      = [module.terraflow-repo]
  source          = "./terraform/codebuild"
  project_name    = var.project_name
  role_arn        = module.terraflow-role.role_arn
  s3_bucket_name  = var.s3_bucket_name
  kms_key_arn     = module.terraflow-key.arn
  source_location = "https://github.com/manestarlara/aws-terraflow.git"
}

module "terraflow-key" {
  source   = "./terraform/kms"
  role_arn = module.terraflow-role.role_arn


}

module "terraflow-role" {
  source                 = "./terraform/iam"
  project_name           = var.project_name
  create_new_role        = var.create_new_role
  source_repository_name = var.source_repository_name
  kms_key_arn            = module.terraflow-key.arn
  s3_bucket_arn          = var.s3_bucket_arn
}

module "terraflow-pipeline" {
  project_name           = var.project_name
  depends_on             = [module.terraflow-codebuild, module.s3-terraflow-bucket]
  source                 = "./terraform/codepipeline"
  codepipeline_role_arn  = module.terraflow-role.role_arn
  source_location        = var.source_location
  source_repository_name = var.source_repository_name
  kms_key_arn            = module.terraflow-key.arn
  s3_bucket_name         = var.s3_bucket_name
  role_arn               = module.terraflow-role.role_arn
}
