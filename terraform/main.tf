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

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version

  vpc_id                  = module.vpc.vpc_id
  vpc_cidr                = var.vpc_cidr
  subnet_ids              = module.vpc.private_subnet_ids
  private_route_table_ids = module.vpc.private_route_table_ids

  endpoint_private_access = true
  endpoint_public_access  = false


  bastion_role_arn = module.ec2.iam_role_arn

  region      = var.region
  environment = "prod"
}


module "ec2" {
  source = "./modules/ec2"

  name          = var.cluster_name
  instance_type = "t3.micro"

  vpc_id    = module.vpc.vpc_id
  subnet_id = module.vpc.public_subnet_ids[0]
}


module "helm" {
  source       = "./modules/helm"
  cluster_name = module.eks.cluster_name
}
