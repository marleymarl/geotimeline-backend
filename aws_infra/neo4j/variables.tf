variable "region" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_id" {
  description = "String(required): VPC ID where to deploy the cluster"
}

variable "subnet_id" {
  type = string
}

variable "key_name" {
  type = string
}

variable "user_data" {
  default = ""
  type    = string
}
