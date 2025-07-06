resource "aws_acm_certificate" "skptech" {
  domain_name       = "*.${var.zone_name}"
  validation_method = "DNS"

  tags = merge(
    local.common_tags,
    {
      Name = "${var.project}-${var.environment}-acm-certificate"
    }
  ) 
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "skptech" {
    for_each = {
        for dvo in aws_acm_certificate.skptech.domain_validation_options : dvo.domain_name => {
            name   = dvo.resource_record_name
            type   = dvo.resource_record_type
            record = dvo.resource_record_value
        } 
    }

    allow_overwrite = true
    name = each.value.name
    type = each.value.type
    records = [each.value.record]
    ttl = 60
    zone_id = var.zone_id
}

resource "aws_acm_certificate_validation" "skptech" {
  certificate_arn = aws_acm_certificate.skptech.arn

  validation_record_fqdns = [
    for record in aws_route53_record.skptech : record.fqdn
  ]
}
