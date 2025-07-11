
data "aws_availability_zones" "all" {
  state = "available"
}
resource "aws_subnet" "private_subnet" {
  count             = var.private_subnets
  vpc_id            = aws_vpc.dev_vpc.id
  cidr_block        = cidrsubnet(var.cidr_block, 4, count.index + 1)
  availability_zone = element(data.aws_availability_zones.all.names, count.index % length(data.aws_availability_zones.all.names))

  tags = {
    Name = "${aws_vpc.dev_vpc.id}-Private subnet ${count.index + 1}"
  }
}
resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.dev_vpc.id
  tags = {
    "Name" = "Private-route-table"
  }
}

resource "aws_route_table_association" "a" {
count = var.private_subnets
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_route_table.id
}

