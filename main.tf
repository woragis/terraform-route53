provider "aws" {
  region = var.aws_region
}

resource "aws_lambda_function" "my_lambda" {
  filename         = "function.zip"
  function_name    = "myLambda"
  role             = aws_iam_role.lambda_exec.arn
  handler          = "index.handler"
  runtime          = "nodejs18.x"
  source_code_hash = filebase64sha256("function.zip")
}

resource "aws_apigatewayv2_api" "http_api" {
  name          = "my-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda" {
  api_id             = aws_apigatewayv2_api.http_api.id
  integration_type   = "AWS_PROXY"
  integration_uri    = aws_lambda_function.my_lambda.invoke_arn
  integration_method = "POST"
}
