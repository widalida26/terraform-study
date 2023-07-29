# default
variable "account_profile" {}
variable "region" {}

# naming
variable "prefix" {}

# sg
variable "sg_def" {
  type = map(any)
}
variable "sg_ingress_web" {
  type = map(any)
}
variable "sg_ingress_db" {
  type = map(any)
}