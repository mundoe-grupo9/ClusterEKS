variable "REGION" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "OWNER" {
  description = "Owner tag for the AWS resources"
  type        = string
  default     = "owner"
}

variable "ENVIRONMENT" {
  description = "Environment"
  type        = string
  default     = "prod"
}

//// NTW ////


variable "vpc_cidr_block" {
  description = "Allowed CIDR blocks for VPC"
  type        = string
}

variable "PUBLIC_IP" {
  description = "Allowed CIDR blocks for Public IP"
  type        = string
  default     = "18.206.107.24"
}

variable "sub_public_availability_zone" {
  description = "Allowed CIDR blocks for Public Subnet Availability Zone"
  type        = string
}

variable "sub_public_cidr_block" {
  description = "Allowed CIDR blocks for Public Subnet"
  type        = string
}

variable "sub_private_availability_zone" {
  description = "Allowed CIDR blocks for Private Subnet Availability Zone"
  type        = string
}

variable "sub_private_cidr_block" {
  description = "Allowed CIDR blocks for Private Subnet"
  type        = string
}

