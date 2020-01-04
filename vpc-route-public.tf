### Public Route Table
resource "aws_route_table" "route_table_public" {
  count  = length(var.public_subnets_cidr) != 0 ? 1 : 0
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-route-table-public"
    },
  )
}

### Public Route Table Associaion
resource "aws_route_table_association" "route_table_association_public" {
  count          = length(var.public_subnets_cidr)
  subnet_id      = element(aws_subnet.subnet_public.*.id, count.index)
  route_table_id = aws_route_table.route_table_public[0].id
}

