output "az_list" {
  value = data.aws_availability_zones.my_azs.names
}