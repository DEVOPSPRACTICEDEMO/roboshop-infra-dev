resource "aws_instance" "vpn" {
    ami = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.vpn_sg_id]
    subnet_id = local.public_subnet_ids[0] # Assuming you want to deploy in the first public subnet
    key_name = "daws" #Make sure this exists in your AWS account
    user_data = file("openvpn.sh")

    tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-vpn"
        }
    )
  
}