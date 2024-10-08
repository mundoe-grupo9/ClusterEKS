variable "REGION" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}



variable "key_name" {
  description = "The name of the key pair to use for the instance"
  type        = string
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
