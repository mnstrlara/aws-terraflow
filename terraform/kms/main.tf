resource "aws_kms_key" "tf-key" {
  description             = "KMS key for TerraFlow project"
  enable_key_rotation     = false
  deletion_window_in_days = 7
  policy = jsondecode({
    Version = "2012-10-17"
    Id      = "key-default-1"
    Statement = [
      {
        Sid    = "Enable IAM User Permissions"
        Effect = Allow
        Principal = {
          AWS = "root"
        },
        Action : "kms:*"
        Resource : "*"
      },
      {
        Sid    = "Allow access for Key Administrators"
        Effect = Allow
        Principal = {
          AWS = var.codepipeline_role_arn
        },
        Action : "kms:*"
        Resource : "*"
      },
      {
        Sid    = "Allow use of the key"
        Effect = Allow
        Principal = {
          AWS = var.codepipeline_role_arn
        },
        Action : [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*",
          "kms:DescribeKey"
        ]
        Resource : "*"
      },
      {
        Sid    = "Allow attachment of persistent resources"
        Effect = Allow
        Principal = {
          AWS = var.codepipeline_role_arn
        },
        Action : [
          "kms:CreateGrant",
          "kms:ListGrants",
          "kms:RevokeGrant"
        ]
        Resource : "*"
      }
    ]
  })
}
