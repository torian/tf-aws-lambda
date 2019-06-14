
variable "function_name" {}

variable "function_desc" {
  type    = string
  default = "Lambda function"
}

variable "filename" {}
variable "runtime"  {}
variable "handler"  {}

variable "memory_size" {
  description = "Function assigned memory"
  type        = number
  default     = 128
}

variable "timeout" {
  description = "Function's timeout"
  type        = number
  default     = 5
}

variable "iam_role_arn" {
  type    = string
  default = ""
}

variable "environment" {
  type = object({
    variables = map(string)
  })
  default = null
}

variable "vpc" {
  type = object({
    security_group_ids = list(string)
    subnet_ids         = list(string)
  })
  default = null
}

variable "tags" {
  type    = map(string)
  default = {}
}

