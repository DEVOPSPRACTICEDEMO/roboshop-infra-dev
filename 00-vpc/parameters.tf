resource "aws_ssm_parameter" "vpc_id" {
  name        = "/${var.project}/${var.environment}/vpc_id"
  description = "VPC ID for the ${var.project} project in ${var.environment} environment"
  type        = "String"
  value       = module.vpc.vpc_id  
}

resource "aws_ssm_parameter" "public_subnet_ids" {
  name        = "/${var.project}/${var.environment}/public_subnet_ids"
  description = "Public Subnet IDs for the ${var.project} project in ${var.environment} environment"
  type        = "StringList"
  value       = join(",",module.vpc.public_subnet_ids)
  
}

resource "aws_ssm_parameter" "private_subnet_ids" {
  name        = "/${var.project}/${var.environment}/private_subnet_ids"
  description = "Private Subnet IDs for the ${var.project} project in ${var.environment} environment"
  type        = "StringList"
  value       = join(",",module.vpc.private_subnet_ids)
  
}

resource "aws_ssm_parameter" "database_subnet_ids" {
  name        = "/${var.project}/${var.environment}/database_subnet_ids"
  description = "Database Subnet IDs for the ${var.project} project in ${var.environment} environment"
  type        = "StringList"
  value       = join(",",module.vpc.database_subnet_ids)
  
}