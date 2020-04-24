variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type        = string
  default     = "geotimeline123.com"
  description = "Must be globally unique (see: S3 Bucket Naming Requirements)"
}

