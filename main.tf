provider "aws" {
  region = var.aws_region
}

serverless_access_key = AKvCNc0Y6Q8cZQixZ1XO4Qv8mooFLI8Oj9WGpdvqypTf1
resource "aws_iam_role" "lambda_exec" {
  count = var.enable_lambda ? 1 : 0

  name = "${var.lambda_function_name}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Effect = "Allow",
      Sid    = ""
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_logs" {
  count      = var.enable_lambda ? 1 : 0
  role       = aws_iam_role.lambda_exec[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "main" {
  count            = var.enable_lambda ? 1 : 0
  function_name    = var.lambda_function_name
  filename         = var.lambda_zip
  handler          = var.lambda_handler
  runtime          = var.lambda_runtime
  role             = aws_iam_role.lambda_exec[0].arn
  source_code_hash = filebase64sha256(var.lambda_zip)
}

resource "aws_apigatewayv2_api" "http_api" {
  count         = var.enable_lambda ? 1 : 0
  name          = "${var.lambda_function_name}-api"
  protocol_type = "HTTP"
}

resource "aws_apigatewayv2_integration" "lambda" {
  count               = var.enable_lambda ? 1 : 0
  api_id              = aws_apigatewayv2_api.http_api[0].id
  integration_type    = "AWS_PROXY"
  integration_uri     = aws_lambda_function.main[0].invoke_arn
  integration_method  = "POST"
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "lambda_route" {
  count        = var.enable_lambda ? 1 : 0
  api_id       = aws_apigatewayv2_api.http_api[0].id
  route_key    = "ANY /"
  target       = "integrations/${aws_apigatewayv2_integration.lambda[0].id}"
}

resource "aws_apigatewayv2_stage" "default" {
  count           = var.enable_lambda ? 1 : 0
  api_id          = aws_apigatewayv2_api.http_api[0].id
  name            = "$default"
  auto_deploy     = true
}
