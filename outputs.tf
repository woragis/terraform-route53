output "record_name" {
  description = "FQDN of the created DNS record"
  value       = aws_route53_record.subdomain.fqdn
}
