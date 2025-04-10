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

## Action usage

```
- name: Set up Route 53 DNS
  uses: ./.github/actions/terraform-route53
  with:
    project-name: 'my-app'
    root-domain: 'example.com'
    subdomain: 'app'
    target-domain: 'd12345.cloudfront.net'
    terraform-dir: './terraform/route53'
```
