variable "aws_region" {
  type = string
}

variable "enable_lambda" {
  type    = bool
  default = true
}

variable "lambda_function_name" {
  type    = string
  default = "my-lambda-app"
}

variable "lambda_handler" {
  type    = string
  default = "index.handler"
}

variable "lambda_runtime" {
  type    = string
  default = "nodejs18.x"
}

variable "lambda_zip" {
  type    = string
  default = "function.zip"
}
