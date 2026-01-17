############################
# EKS Cluster
############################

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version for the EKS cluster"
  type        = string
}

############################
# Networking
############################

variable "vpc_id" {
  description = "VPC ID where EKS and endpoints are deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC (used for security groups)"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs for the EKS cluster and VPC interface endpoints"
  type        = list(string)
}

variable "private_route_table_ids" {
  description = "Route table IDs for private subnets (used by S3 gateway endpoint)"
  type        = list(string)
}

############################
# EKS API Access
############################

variable "endpoint_private_access" {
  description = "Enable private access to the EKS API server"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Enable public access to the EKS API server"
  type        = bool
  default     = false
}

############################
# Security Groups
############################

variable "security_group_ids" {
  description = "Security group IDs attached to the EKS control plane"
  type        = list(string)
}

############################
# AWS Region
############################

variable "region" {
  description = "AWS region (used for VPC endpoint service names)"
  type        = string
}
