variable "sg_id" {}
variable "from_port" {}
variable "to_port" {}
variable "ip_protocol" {}
variable "cidr_ipv4" {
  default = "0.0.0.0/0"
}
variable "prefix_list_id" {
  default = ""
}
variable "referenced_sg_id" {
  default = ""
}