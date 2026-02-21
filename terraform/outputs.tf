output "vpc_id" {
  value     = module.vpc.vpc_id
  sensitive = true
}

output "public_subnet_ids" {
  value     = module.vpc.public_subnet_ids
  sensitive = true
}

output "private_subnet_ids" {
  value     = module.vpc.private_subnet_ids
  sensitive = true
}

output "cluster_name" {
  value     = module.eks.cluster_name
  sensitive = true
}

output "cluster_security_group_id" {
  value     = module.eks.eks_cluster_sg_id
  sensitive = true
}
