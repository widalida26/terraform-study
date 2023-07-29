resource "aws_vpc" "vpc_test" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

module "sg" {
  source = "./modules/terraform-aws-sg"

  for_each    = var.sg_def
  name        = "${var.prefix}-${each.value.name}"
  description = each.value.description
  vpc_id      = aws_vpc.vpc_test.id
}

module "sg_ingress_rule_web" {
  depends_on = [module.sg]
  source     = "./modules/terraform-aws-sg-ingress"

  for_each    = var.sg_ingress_web
  sg_id       = module.sg["web"].id
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.ip_protocol
}

module "sg_ingress_rule_db" {
  depends_on = [module.sg]
  source     = "./modules/terraform-aws-sg-ingress"

  for_each    = var.sg_ingress_db
  sg_id       = module.sg["db"].id
  from_port   = each.value.from_port
  to_port     = each.value.to_port
  ip_protocol = each.value.ip_protocol
}