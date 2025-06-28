module "vpc" {
     #source = "../terraform-aws-vpc"
     source = "git::https://github.com/DEVOPSPRACTICEDEMO/terraform-aws-vpc.git?ref=main"
    /*project = "roboshop"
    environment = "dev"
    public_subnet_cidr = ["10.0.1.0/24", "10.0.2.0/24"] */
    project =var.project  
    environment = var.environment
    private_subnet_cidr = var.private_subnet_cidr
    public_subnet_cidr = var.public_subnet_cidr
    database_subnet_cidr = var.database_subnet_cidr

    is_peering_required = true
}

/* output "vpc_ids" {
  value = module.vpc.public_subnet_ids
  
} */