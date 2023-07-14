output "az_list" {
  value = data.aws_availability_zones.available_azs.names
}