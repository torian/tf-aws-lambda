# vim:ts=2:sw=2:et:

resource "aws_lambda_function" "f" {

  function_name     = var.function_name
  description       = var.function_desc
  runtime           = var.runtime
  handler           = var.handler
  memory_size       = var.memory_size
  timeout           = var.timeout
  role              = local.iam_role_arn

  filename         = var.filename
  source_code_hash = filebase64sha256(var.filename)

  dynamic "environment" {
    for_each = local.environment 
    iterator = env

    content {
      variables = env.value.variables
    }
  }

  dynamic "vpc_config" {
    for_each = local.vpc
    iterator = cfg

    content {
      security_group_ids = cfg.value.security_group_ids
      subnet_ids         = cfg.value.subnet_ids
    }
  }

  tags = var.tags

}

output "function" {
  value = aws_lambda_function.f
}

