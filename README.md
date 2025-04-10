# Terraform Route53

## Usage

```
module "route53" {
  source = "./terraform-route53"

  aws_region        = var.aws_region
  root_domain       = "example.com"
  subdomain         = "www"
  target_domain     = module.static_site.website_endpoint
  target_record_type = "CNAME"
}
```
