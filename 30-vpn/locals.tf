locals {
    ami_id = data.aws_ami.openvpn.id
    public_subnet_ids = split(",", data.aws_ssm_parameter.public_subnet_ids.value)
    vpn_sg_id = data.aws_ssm_parameter.vpn_sg_id.value
    
    common_tags = {
        Project     = var.project
        Environment = var.environment
        Terraform   = "true"
    }
}