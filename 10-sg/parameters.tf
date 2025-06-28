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