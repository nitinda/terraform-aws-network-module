resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  domain_name_servers = "${var.domain_name_serverss}"
  domain_name         = "${var.domain_name}"
}