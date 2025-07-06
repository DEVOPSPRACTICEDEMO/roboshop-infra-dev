resource "aws_lb_target_group" "catalogue" {
    name = "${var.project}-${var.environment}-catalogue"
    port = 8080
    protocol = "HTTP"
    vpc_id = local.vpc_id
    deregistration_delay = 120

    health_check {
      healthy_threshold = 2
      interval = 5
      matcher = "200-299"
      path = "/health"
      port = 8080
      timeout = 2
      unhealthy_threshold = 3
    } 
}

resource "aws_instance" "catalogue" {
    ami           = local.ami_id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.catalogue_sg_id]
    subnet_id     = local.private_subnet_id
   # iam_instance_profile = "EC2RoleToFetchSSMParameters"
    
    tags = merge(
        local.common_tags,
        {
        Name = "${var.project}-${var.environment}-catalogue"
        }
    )
}

resource "terraform_data" "catalogue" {
    triggers_replace = [
        aws_instance.catalogue.id,
    ]

    provisioner "file" {
        source      = "catalogue.sh"
        destination = "/tmp/catalogue.sh"
    }

    connection {
        type        = "ssh"
        user        = "ec2-user"
        password    = "DevOps321"
        host        = aws_instance.catalogue.private_ip
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/catalogue.sh",
            "sudo sh /tmp/catalogue.sh catalogue ${var.environment}"
        ]
      
    } 
}

resource "aws_ec2_instance_state" "catalogue" {
    instance_id = aws_instance.catalogue.id
    state       = "stopped"
    depends_on = [terraform_data.catalogue]
}

resource "aws_ami_from_instance" "catalogue" {
    name               = "${var.project}-${var.environment}-catalogue"
    source_instance_id = aws_instance.catalogue.id
    depends_on = [aws_ec2_instance_state.catalogue]

    tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-catalogue"
        }
    )
}

resource "terraform_data" "catalogue_delete" {
    triggers_replace = [
        aws_instance.catalogue.id,
    ]
    #Make sure you have aws configured with in the system
    provisioner "local-exec" {
        command = "aws ec2 terminate-instances --instance-ids ${aws_instance.catalogue.id}"
    }

    depends_on = [aws_ami_from_instance.catalogue]  
}

resource "aws_launch_template" "catalogue" {
    name          = "${var.project}-${var.environment}-catalogue"
    image_id      = aws_ami_from_instance.catalogue.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [local.catalogue_sg_id]
    update_default_version = true #each time a new AMI is created, this will update the default version of the launch template

    tag_specifications {
        resource_type = "instance"
        
        tags = merge(
            local.common_tags,
            {
                Name = "${var.project}-${var.environment}-catalogue"
            }
        )
    }

    tag_specifications {
        resource_type = "volume"
        
        tags = merge(
            local.common_tags,
            {
                Name = "${var.project}-${var.environment}-catalogue"
            }
        )
    }

    # launch template tags
    tags = merge(
        local.common_tags,
        {
            Name = "${var.project}-${var.environment}-catalogue"
        }
    )
  
}

resource "aws_autoscaling_group" "catalogue" {
    name = "${var.project}-${var.environment}-catalogue-asg"
    min_size            = 1
    max_size            = 8
    desired_capacity    = 1
    force_delete         = true
    target_group_arns = [aws_lb_target_group.catalogue.arn]
    vpc_zone_identifier = local.private_subnet_ids
    health_check_grace_period = 90
    health_check_type = "ELB"


    launch_template {
        id      = aws_launch_template.catalogue.id
        version = aws_launch_template.catalogue.latest_version
    }

    dynamic "tag" {
        for_each = merge(
            local.common_tags,
            {
                Name = "${var.project}-${var.environment}-catalogue"
            }
        )
        content{
            key                 = tag.key
            value               = tag.value
            propagate_at_launch = true
        }
        
    }

    instance_refresh {
        strategy = "Rolling"
        preferences {
            min_healthy_percentage = 50
        }
    triggers = ["launch_template"]
    }

    timeouts {
        delete = "10m"
    }
  
}

resource "aws_autoscaling_policy" "catalogue_scale_up" {
    name                   = "${var.project}-${var.environment}-catalogue-scale-up"
    autoscaling_group_name = aws_autoscaling_group.catalogue.name
    policy_type = "TargetTrackingScaling"
    target_tracking_configuration {
      predefined_metric_specification {
        predefined_metric_type = "ASGAverageCPUUtilization"
      }
      target_value = 75.0
    }
}

resource "aws_lb_listener_rule" "catalogue" {
    listener_arn = local.backend_alb_listener_arn
    priority     = 10
    action {
        type             = "forward"
        target_group_arn = aws_lb_target_group.catalogue.arn
    }
    condition {
        host_header {
          values = ["catalogue.backend-${var.environment}.${var.zone_name}"]
        }
    }
  
}