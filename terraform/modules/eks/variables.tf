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
# Networking (from VPC module)
############################

variable "vpc_id" {
  description = "VPC ID where the EKS cluster and VPC endpoints are deployed"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block of the VPC (used for security group rules)"
  type        = string
}

variable "subnet_ids" {
  description = "Private subnet IDs used by the EKS cluster and interface VPC endpoints"
  type        = list(string)
}

variable "private_route_table_ids" {
  description = "Private route table IDs used by the S3 gateway VPC endpoint"
  type        = list(string)
}

############################
# EKS API Access (private-only)
############################

variable "endpoint_private_access" {
  description = "Enable private access to the EKS API server"
  type        = bool
  default     = true
}

variable "endpoint_public_access" {
  description = "Disable public access to the EKS API server"
  type        = bool
  default     = false
}

variable "bastion_role_arn" {
  description = "IAM role ARN of the bastion instance for EKS access"
  type        = string
}

############################
# AWS Region
############################

variable "region" {
  description = "AWS region (used for VPC endpoint service names)"
  type        = string
}


############################
# Node Group Configuration
############################

variable "node_capacity_type" {
  description = "ON_DEMAND or SPOT"
  type        = string
  default     = "ON_DEMAND"
}

variable "node_instance_types" {
  description = "EC2 instance types for worker nodes"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "node_disk_size" {
  description = "Disk size in GiB for worker nodes"
  type        = number
  default     = 20
}

variable "node_desired_size" {
  description = "Desired number of worker nodes"
  type        = number
  default     = 2
}

variable "node_min_size" {
  description = "Minimum number of worker nodes"
  type        = number
  default     = 1
}

variable "node_max_size" {
  description = "Maximum number of worker nodes"
  type        = number
  default     = 4
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "production"
}
