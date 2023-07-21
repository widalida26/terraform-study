resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.vpc.id
  count             = local.az_count
  cidr_block        = element(var.public_subnet_cidrs, count.index)
  availability_zone = local.az_names[count.index]

  tags = {
    Name = "${var.prefix}-public-subnet-${var.availability_zones[count.index % length(local.az_names)]}${floor(count.index / local.az_count + 1)}"
  }
}