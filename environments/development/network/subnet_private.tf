resource "aws_subnet" "subnet_private0" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.64.0/24"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = false
    tags = {
        "Name" = "c_kurita"
    }
}
resource "aws_subnet" "subnet_private1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.65.0/24"
    availability_zone = "us-east-2c"
    map_public_ip_on_launch = false
    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_route_table" "route_table_private0" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        "Name" = "c_kurita"
    }
}
resource "aws_route_table" "route_table_private1" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_route" "route0" {
    route_table_id = aws_route_table.route_table_private0.id
    nat_gateway_id = aws_nat_gateway.nat_gateway0.id
    destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route" "route1" {
    route_table_id = aws_route_table.route_table_private1.id
    nat_gateway_id = aws_nat_gateway.nat_gateway0.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "route_table_association0" {
	subnet_id = aws_subnet.subnet_private0.id
	route_table_id = aws_route_table.route_table_private0.id
}
resource "aws_route_table_association" "route_table_association1" {
	subnet_id = aws_subnet.subnet_private1.id
	route_table_id = aws_route_table.route_table_private1.id
}