resource "aws_eip" "epi" {
  count = length(var.private_subnets_cidr)
  vpc   = true
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-epi"
    },
  )
}

resource "aws_nat_gateway" "nat_gateway" {
  count         = length(var.private_subnets_cidr)
  allocation_id = aws_eip.epi[count.index].id
  subnet_id     = aws_subnet.subnet_public[count.index].id
  depends_on    = [aws_internet_gateway.internet_gateway]
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-nat-gateway-${count.index}"
    },
  )
}

