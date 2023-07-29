resource "aws_vpc" "vpc_test" {
  cidr_block           = "10.10.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

module "sg" {
  source =  "github.com/widalida26/terraform-study/week_04/02_modulize/modules/terraform-aws-sg"

  for_each    = var.sg_def
  name        = "${var.prefix}-${each.value.name}"
  description = each.value.description
  vpc_id      = aws_vpc.vpc_test.id
}
