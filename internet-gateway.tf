resource "aws_internet_gateway" "demo_internet_gateway" {
  vpc_id = aws_vpc.demo_vpc.id
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-internet-gateway"
    },
  )
}

