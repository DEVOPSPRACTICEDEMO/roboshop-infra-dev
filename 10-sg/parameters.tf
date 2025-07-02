resource "aws_ssm_parameter" "frontend_sg_id" {
  name        = "/${var.project}/${var.environment}/frontend_sg_id"
  type        = "String"
  value       = module.frontend.sg_id
  description = "Frontend Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}

resource "aws_ssm_parameter" "bastion_sg_id" {
  name        = "/${var.project}/${var.environment}/bastion_sg_id"
  type        = "String"
  value       = module.bastion.sg_id
  description = "Bastion Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}

resource "aws_ssm_parameter" "backend_alb_sg_id" {
  name        = "/${var.project}/${var.environment}/backend_alb_sg_id"
  type        = "String"
  value       = module.backend_alb.sg_id
  description = "Backend ALB Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  
}

resource "aws_ssm_parameter" "vpn_sg_id" {
  name        = "/${var.project}/${var.environment}/vpn_sg_id"
  type        = "String"
  value       = module.vpn.sg_id
  description = "VPN Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  
}

resource "aws_ssm_parameter" "mongodb_sg_id" {
  name        = "/${var.project}/${var.environment}/mongodb_sg_id"
  type        = "String"
  value       = module.mongodb.sg_id
  description = "MongoDB Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  
}

resource "aws_ssm_parameter" "redis_sg_id" {
  name        = "/${var.project}/${var.environment}/redis_sg_id"
  type        = "String"
  value       = module.redis.sg_id
  description = "Redis Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
  
}

resource "aws_ssm_parameter" "mysql_sg_id" {
  name        = "/${var.project}/${var.environment}/mysql_sg_id"
  type        = "String"
  value       = module.mysql.sg_id
  description = "MySQL Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}

resource "aws_ssm_parameter" "rabbitmq_sg_id" {
  name        = "/${var.project}/${var.environment}/rabbitmq_sg_id"
  type        = "String"
  value       = module.rabbitmq.sg_id
  description = "RabbitMQ Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}

resource "aws_ssm_parameter" "catalogue_sg_id" {
  name        = "/${var.project}/${var.environment}/catalogue_sg_id"
  type        = "String"
  value       = module.catalogue.sg_id
  description = "Catalogue Security Group ID for the ${var.project} project in ${var.environment} environment"
  tags = {        
    Project     = var.project
    Environment = var.environment
    Terraform   = "true"
  }
}

