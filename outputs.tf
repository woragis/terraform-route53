output "lambda_url" {
  value       = aws_apigatewayv2_api.http_api[0].api_endpoint
  description = "Your Lambda app's public URL"
}