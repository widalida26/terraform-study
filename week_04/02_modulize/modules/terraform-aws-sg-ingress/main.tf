resource "aws_vpc_security_group_ingress_rule" "sg_ingress_rules" {
  security_group_id = var.sg_id
  from_port         = var.from_port
  to_port           = var.to_port
  ip_protocol       = var.ip_protocol
  cidr_ipv4         = var.cidr_ipv4
}