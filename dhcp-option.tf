resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  domain_name_servers = var.domain_name_servers != [] ? ["AmazonProvidedDNS"] : var.domain_name_servers
  domain_name         = var.domain_name == "" ? "${data.aws_region.current.name}.compute.internal" : var.domain_name
  tags = merge(
    var.common_tags,
    {
      "Name" = "${var.tag_name_prefix}-dhcp-options"
    },
  )
}

