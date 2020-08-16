resource "aws_subnet" "subnet_public0" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-2a"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "c_kurita"
    }
}
resource "aws_subnet" "subnet_public1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-2c"
    map_public_ip_on_launch = true

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_route_table_association" "subnet_public0" {
	subnet_id = aws_subnet.subnet_public0.id
	route_table_id = aws_route_table.route_table_public.id
}
resource "aws_route_table_association" "subnet_public1" {
	subnet_id = aws_subnet.subnet_public1.id
	route_table_id = aws_route_table.route_table_public.id
}


resource "aws_route_table" "route_table_public" {
    vpc_id = aws_vpc.vpc.id

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_route" "route" {
    route_table_id = aws_route_table.route_table_public.id
    gateway_id = aws_internet_gateway.internet_gateway.id
    destination_cidr_block = "0.0.0.0/0"
}

