resource "aws_subnet" "infratest-dev-private_0" {
    vpc_id = aws_vpc.infratest-dev-vpc.id
    cidr_block = "10.0.64.0/24"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = false
    tags = {
        "Name" = "c_kurita"
    }
}
resource "aws_subnet" "infratest-dev-private_1" {
    vpc_id = aws_vpc.infratest-dev-vpc.id
    cidr_block = "10.0.65.0/24"
    availability_zone = "us-east-2c"
    map_public_ip_on_launch = false
    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_route_table" "infratest-dev-private_0" {
    vpc_id = aws_vpc.infratest-dev-vpc.id

    tags = {
        "Name" = "c_kurita"
    }
}
resource "aws_route_table" "infratest-dev-private_1" {
    vpc_id = aws_vpc.infratest-dev-vpc.id

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_route" "infratest-dev-private_0" {
    route_table_id = aws_route_table.infratest-dev-private_0.id
    nat_gateway_id = aws_nat_gateway.infratest-dev-ngw_0.id
    destination_cidr_block = "0.0.0.0/0"
}
resource "aws_route" "infratest-dev-private_1" {
    route_table_id = aws_route_table.infratest-dev-private_1.id
    nat_gateway_id = aws_nat_gateway.infratest-dev-ngw_1.id
    destination_cidr_block = "0.0.0.0/0"
}

resource "aws_route_table_association" "infratest-dev-private_0" {
	subnet_id = aws_subnet.infratest-dev-private_0.id
	route_table_id = aws_route_table.infratest-dev-private_0.id
}
resource "aws_route_table_association" "infratest-dev-private_1" {
	subnet_id = aws_subnet.infratest-dev-private_1.id
	route_table_id = aws_route_table.infratest-dev-private_1.id
}
