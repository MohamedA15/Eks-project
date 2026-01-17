############################
# EKS Cluster
############################

output "cluster_id" {
  description = "EKS cluster ID"
  value       = aws_eks_cluster.this.id
}

output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  description = "Private endpoint for the EKS API server"
  value       = aws_eks_cluster.this.endpoint
}

output "cluster_ca_certificate" {
  description = "Base64 encoded CA certificate for the EKS cluster"
  value       = aws_eks_cluster.this.certificate_authority[0].data
}

############################
# Security Groups
############################

output "eks_cluster_sg_id" {
  description = "Security group ID for the EKS control plane"
  value       = aws_security_group.eks_cluster.id
}

output "vpc_endpoint_sg_id" {
  description = "Security group ID used by VPC interface endpoints"
  value       = aws_security_group.vpc_endpoints.id
}

############################
# IAM
############################

output "eks_cluster_role_arn" {
  description = "IAM role ARN used by the EKS control plane"
  value       = aws_iam_role.eks_cluster.arn
}

output "node_group_name" {
  description = "Name of the default EKS node group"
  value       = aws_eks_node_group.default.node_group_name
}

output "node_group_arn" {
  description = "ARN of the default EKS node group"
  value       = aws_eks_node_group.default.arn
}

output "node_group_role_arn" {
  description = "IAM role ARN used by worker nodes"
  value       = aws_iam_role.eks_node_role.arn
}
