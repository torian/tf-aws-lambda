# vim:ts=2:sw=2:et:

locals {
 
  iam_role_arn = var.iam_role_arn #!= "" ? var.iam_role_arn : aws_iam_role.role.arn

  environment = var.environment != null ? [ var.environment ] : []
  vpc         = var.vpc         != null ? [ var.vpc         ] : []

}

