resource "aws_subnet" "public_subnet" {
  for_each = var.public_subnet

  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value["cidr"]
  availability_zone = "${var.region}${each.value["az"]}"

  tags = {
    Name = "${var.prefix}-public-subnet-${each.value["az"]}"
  }
}