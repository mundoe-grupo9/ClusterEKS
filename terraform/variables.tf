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

# Añade estas variables a tu archivo variables.tf existente

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = "grupo9-eks-cluster"  # Puedes cambiar este valor predeterminado
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.27"  # Esta es una versión común, pero puedes ajustarla
}

# Variables adicionales necesarias para EKS
variable "eks_node_group_instance_types" {
  description = "List of instance types for the EKS node group"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "eks_node_group_desired_size" {
  description = "Desired size of the EKS node group"
  type        = number
  default     = 2
}

variable "eks_node_group_max_size" {
  description = "Maximum size of the EKS node group"
  type        = number
  default     = 4
}

variable "eks_node_group_min_size" {
  description = "Minimum size of the EKS node group"
  type        = number
  default     = 1
}