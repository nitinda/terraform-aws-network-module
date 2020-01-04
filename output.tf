output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "web_subnet_ids" {
  value = aws_subnet.subnet_private.*.id
}

output "web_subnet_cidr_blocks" {
  value = aws_subnet.subnet_private.*.cidr_block
}

output "public_subnet_ids" {
  value = aws_subnet.subnet_public.*.id
}

output "public_subnet_cidr_blocks" {
  value = aws_subnet.subnet_public.*.cidr_block
}

output "db_subnet_ids" {
  value = aws_subnet.subnet_db.*.id
}

output "db_subnet_cidr_blocks" {
  value = aws_subnet.subnet_db.*.cidr_block
}

output "nat_gateway_ids" {
  value = aws_nat_gateway.nat_gateway.*.id
}

