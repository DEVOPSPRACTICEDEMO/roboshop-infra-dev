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

variable "backend_alb_sg_name" {
  description = "Name of the backend ALB security group"
  default = "backend-alb"
  
}

variable "backend_alb_sg_description" {
  description = "Description of the backend ALB security group"
  default = "created sg for backend ALB"
  
}

variable "vpn_sg_name" {
  description = "Name of the VPN security group"
  default = "vpn"
  
}

variable "vpn_sg_description" {
  description = "Description of the VPN security group"
  default = "created sg for VPN connection" 
  
}

variable "mongodb_ports_vpn" {
  description = "Port for MongoDB"
  default = [22, 27017]
  
}

variable "redis_ports_vpn" {
  description = "Port for Redis"
  default = [22, 6379]
  
}

variable "mysql_ports_vpn" {
  description = "Port for MySQL"
  default = [22, 3306]
  
}

variable "rabbitmq_ports_vpn" {
  description = "Port for RabbitMQ"
  default = [22, 5672]
  
}