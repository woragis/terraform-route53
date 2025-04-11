variable "aws_region" {
  type = string
}

variable "root_domain" {
  type = string
}

variable "subdomain" {
  type = string
}

variable "target_record_type" {
  type        = string
  description = "DNS record type (e.g., A, CNAME)"
  default     = "CNAME"
}

variable "target_domain" {
  type        = string
  description = "Target for the DNS record (e.g., d123.cloudfront.net)"
}

variable "ttl" {
  type    = number
  default = 300
}
