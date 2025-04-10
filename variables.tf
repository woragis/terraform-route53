variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "root_domain" {
  description = "Root domain (e.g., example.com)"
  type        = string
}

variable "subdomain" {
  description = "Subdomain (e.g., www, app)"
  type        = string
}

variable "target_domain" {
  description = "The domain or service to point to (e.g., S3 website or CloudFront domain)"
  type        = string
}

variable "target_record_type" {
  description = "DNS record type to create (e.g., CNAME, A)"
  type        = string
  default     = "CNAME"
}

variable "ttl" {
  description = "Time to live (TTL) for the DNS record"
  type        = number
  default     = 300
}
