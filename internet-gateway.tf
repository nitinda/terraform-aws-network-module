resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-internet-gateway"
    },
  )
}

