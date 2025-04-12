variable "aws_region" {
  type = string
}

variable "root_domain" {
  type        = string
  description = "The root domain name (e.g., example.com)"
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

variable "environment" {
  description = "Environment name for tagging"
  type        = string
  default     = "dev"
}

variable "project_name" {
  description = "Project name for tagging"
  type        = string
}
