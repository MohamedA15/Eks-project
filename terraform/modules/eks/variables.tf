variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
}

variable "security_group_ids" {
  description = "Security groups for EKS control plane"
  type        = list(string)
}

variable "subnet_ids" {
  description = "Subnets for EKS cluster"
  type        = list(string)
}

variable "endpoint_private_access" {
  type    = bool
  default = true
}

variable "endpoint_public_access" {
  type    = bool
  default = false
}

variable "public_access_cidrs" {
  type    = list(string)
  default = []
}
