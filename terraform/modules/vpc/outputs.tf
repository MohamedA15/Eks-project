############################
# VPC
############################

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.this.id
}

output "vpc_cidr" {
  description = "VPC CIDR block"
  value       = var.vpc_cidr
}

############################
# Subnets
############################

output "public_subnet_ids" {
  description = "Public subnet IDs"
  value       = aws_subnet.public[*].id
}

output "private_subnet_ids" {
  description = "Private subnet IDs"
  value       = aws_subnet.private[*].id
}

############################
# Route tables
############################

output "private_route_table_ids" {
  description = "Private route table IDs"
  value       = [aws_route_table.private.id]
}
