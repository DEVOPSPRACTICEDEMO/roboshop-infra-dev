variable "project" {
  description = "Project name for tagging"
  default     = "roboshop"
}

variable "environment" {
  description = "Environment name for tagging"
  default     = "dev"   
}

variable "zone_id" {
  description = "Route53 Hosted Zone ID"
  default = "Z07092431FXHTW58PX8NM"  
}

variable "zone_name" {
  description = "Route53 Hosted Zone Name"
  default     = "skptech.site"
  
}

