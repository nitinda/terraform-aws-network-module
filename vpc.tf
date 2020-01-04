resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-vpc"
    },
  )
}

