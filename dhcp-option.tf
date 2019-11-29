resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  domain_name_servers = "${var.domain_name_servers}"
  domain_name         = "${var.domain_name}"
  tags                = "${merge(var.common_tags, map("Name", "${var.tag_name_prefix}-dhcp-options",))}"
}