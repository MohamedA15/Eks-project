provider "aws" {
  region = var.region
}

module "vpc" {
  source = "./modules/vpc"

  vpc_name             = var.vpc_name
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}


module "eks" {
  source = "./modules/eks"

  # Cluster
  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  # Networking 
  vpc_id                  = module.vpc.vpc_id
  vpc_cidr                = module.vpc.vpc_cidr
  subnet_ids              = module.vpc.private_subnet_ids
  private_route_table_ids = module.vpc.private_route_table_ids

  # EKS API access
  endpoint_private_access = true
  endpoint_public_access  = false

  # Region
  region = var.region
}
