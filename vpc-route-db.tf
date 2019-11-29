### Database Route Table
resource "aws_route_table" "demo_route_table_db" {
    count  = "${length(var.db_subnets_cidr) != 0 ? 1 : 0}"
    vpc_id = "${aws_vpc.demo_vpc.id}"
    tags   = "${merge(var.common_tags, map(
        "Name", "terraform-demo-route-table-db",
    ))}"
}

### Database Route Table Associaion
resource "aws_route_table_association" "demo_route_table_association_db" {
  count          = "${length(var.db_subnets_cidr)}"
  subnet_id      = "${element(aws_subnet.demo_subnet_db.*.id, count.index)}"
  route_table_id = "${aws_route_table.demo_route_table_db.id}"
}