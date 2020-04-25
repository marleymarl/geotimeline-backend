variable "region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type        = string
  default     = "geotimeline123.com"
  description = "Must be globally unique (see: S3 Bucket Naming Requirements)"
}


variable "rds_class" {
  type    = string
  default = "db.t2.micro"
}

variable "rds_storage" {
  type    = number
  default = 5
}

variable "rds_backup_retention" {
  type    = number
  default = 7
}

variable "rds_engine" {
  type    = string
  default = "mysql"
}

variable "rds_version" {
  type    = string
  default = "5.6.40"
}

variable "rds_username" {
  type    = string
  default = "rds_admin"
}
