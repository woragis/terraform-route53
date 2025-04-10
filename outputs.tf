output "record_name" {
  description = "FQDN of the created DNS record"
  value       = aws_route53_record.subdomain.fqdn
}

output "zone_id" {
  description = "Route53 hosted zone ID"
  value       = data.aws_route53_zone.primary.zone_id
}
