resource "aws_subnet" "demo_subnet_private" {
  count             = "${length(var.private_subnets_cidr)}"
  vpc_id            = "${aws_vpc.demo_vpc.id}"
  cidr_block        = "${var.private_subnets_cidr[count.index]}"
  availability_zone = "${data.aws_availability_zones.demo_available.names}"

  tags = "${merge(var.common_tags, map(
    "Name", "terraform-demo-subnet-private-${count.index}",
  ))}"
}