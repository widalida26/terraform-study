# default
variable "account_profile" {}
variable "region" {}
variable "availability_zones" {}
variable "prefix" {}

# vpc
variable "vpc_cidr" {}
# subnet
variable "public_subnet_cidrs" {}

# ec2
variable "instance_type" {}
variable "key_name" {}
#userdata
variable "is_apache" {}