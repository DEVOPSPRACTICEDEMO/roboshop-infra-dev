variable "project" {
  description = "Project name for tagging"
  default = "roboshop"  
}

variable "environment" {
  description = "Environment name for tagging"
  default = "dev"
}

variable "frontend_sg_name" {
  description = "Name of the frontend security group"
  default = "frontend"
  
}

variable "frontend_sg_description" {
  description = "Description of the frontend security group"
  default = "created sg for frontend"
  
}

variable "bastion_sg_name" {
  description = "Name of the bastion security group"
  default = "bastion"
  
}

variable "bastion_sg_description" {
  description = "Description of the bastion security group"
  default = "created sg for bastion instance"
  
}