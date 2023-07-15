resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = length(data.aws_availability_zones.available_azs.names)
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = data.aws_availability_zones.available_azs.names[count.index]

  tags = {
    Name = "${var.prefix}-public-subnet-${substr(data.aws_availability_zones.available_azs.names[count.index], -1, 0)}"
  }
}