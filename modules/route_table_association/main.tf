resource "aws_route_table_association" "kido" {
  subnet_id      = var.private_subnet_id
  route_table_id = var.private_route_table_id
}

resource "aws_route_table_association" "public_route_table" {
  subnet_id      = var.public_subnet_id
  route_table_id = var.public_route_table_id
}