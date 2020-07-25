resource "aws_subnet" "infratest-dev-public_0" {
    vpc_id = aws_vpc.infratest-dev-vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "c_kurita"
    }
}
resource "aws_subnet" "infratest-dev-public_1" {
    vpc_id = aws_vpc.infratest-dev-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2c"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_route_table_association" "infratest-dev-public_0" {
	subnet_id = aws_subnet.infratest-dev-public_0.id
	route_table_id = aws_route_table.infratest-dev-rt.id
}
resource "aws_route_table_association" "infratest-dev-public_1" {
	subnet_id = aws_subnet.infratest-dev-public_1.id
	route_table_id = aws_route_table.infratest-dev-rt.id
}


resource "aws_route_table" "infratest-dev-rt" {
    vpc_id = aws_vpc.infratest-dev-vpc.id

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_route" "infratest-dev-route" {
    route_table_id = aws_route_table.infratest-dev-rt.id
    gateway_id = aws_internet_gateway.infratest-dev-igw.id
    destination_cidr_block = "0.0.0.0/0"
}

