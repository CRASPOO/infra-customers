variable "region" {
  type    = string
  default = "us-east-1"
}
variable "cluster_name" {
  type = string
  default = "SistemaPedidos-eks"
}

variable "expiry_hours" {
  type = number
  default = 24
}

locals {
  expiry_iso = timeadd(timestamp(), format("%dh", var.expiry_hours))
}

variable "tags_prod" {
  type = map(any)
  default = {
    Name        = "TFEKS",
    Environment = "Production",
    School = "FIAP",
    Year = "2025"
  }
}
variable "tags" {
  default = {
    Name = "terraform-infra-EKS"
  }
}
variable "instance-type" {
  default = "t3.medium"
}

variable "cidr_vpc" {
  default = "10.0.0.0/16"
}

variable "principal_user_arn" {
  type    = string
  default = "arn:aws:iam::579375260812:user/camila"
}

variable "bucket_name_backend" {
  default = "sistemapedidos-eks"
}

variable "bucket_key_backend" {
  default = "infraeks.tfstate"
}