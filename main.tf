provider "aws" {
  region = var.aws_region
}

data "aws_route53_zone" "primary" {
  name = var.root_domain

  tags = {
    Environment = var.environment
    Project     = var.project_name
  }
}

resource "aws_route53_record" "subdomain" {
  zone_id = data.aws_route53_zone.primary.zone_id
  name    = local.fqdn
  type    = var.target_record_type
  ttl     = var.ttl
  records = [var.target_domain]

  allow_overwrite = true
}
