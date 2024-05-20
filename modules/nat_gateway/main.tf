resource "aws_eip" "main-eip" {
  vpc = true
}

resource "aws_nat_gateway" "ng" {
  allocation_id = aws_eip.main-eip.id
  subnet_id     = var.public_subnet_id
  depends_on    = [var.internet_gateway_id]

  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route" "rtb" {
  gateway_id             = aws_nat_gateway.ng.id
  route_table_id         = var.private_route_table_id
  destination_cidr_block = var.nat_gateway_cidr_block
}