### Private Route Table
resource "aws_route_table" "route_table_private" {
  count  = length(var.private_subnets_cidr)
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-route-table-private-${count.index}"
    },
  )
}

### Private Route
resource "aws_route" "route_private" {
  count                  = length(var.private_subnets_cidr) != 0 ? length(var.private_subnets_cidr) : 0
  route_table_id         = aws_route_table.route_table_private[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway[count.index].id
  depends_on             = [aws_route_table.route_table_private]
}

### Private Route Table Associaion
resource "aws_route_table_association" "route_table_association_private" {
  count          = length(var.private_subnets_cidr)
  subnet_id      = element(aws_subnet.subnet_private.*.id, count.index)
  route_table_id = aws_route_table.route_table_private[count.index].id
}

