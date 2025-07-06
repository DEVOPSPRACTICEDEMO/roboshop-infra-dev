variable "project" {
    description = "The name of the project"
    default     = "roboshop"  
}

variable "environment" {
    description = "The environment for the project (e.g., dev, prod)"
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