resource "aws_eip" "main-eip" {
  vpc = true
}

resource "aws_internet_gateway" "igw" {
  vpc_id = var.vpc_id

  tags = {
    Name = var.igw_name
  }
}

resource "aws_route" "private_route" {
  gateway_id             = aws_internet_gateway.igw.id
  route_table_id         = var.route_table_id
  destination_cidr_block = var.destination_cidr_block
}