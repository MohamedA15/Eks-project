variable "region" {
  type    = string
  default = "eu-west-2"
}

variable "vpc_name" {
  type    = string
  default = "eks-project"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type    = list(string)
  default = ["eu-west-2a", "eu-west-2b"]
}

variable "public_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}


variable "cluster_name" {
  type    = string
  default = "private-eks"
}

variable "cluster_version" {
  type    = string
  default = "1.29"
}

variable "terraform_admin_role_arn" {
  description = "IAM role ARN used by Terraform to administer EKS"
  type        = string
}

