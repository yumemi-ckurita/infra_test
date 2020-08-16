resource "aws_eip" "elastic_ip0" {
    vpc = true
    depends_on = [aws_internet_gateway.internet_gateway]

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_eip" "elastic_ip1" {
    vpc = true
    depends_on = [aws_internet_gateway.internet_gateway]

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_nat_gateway" "nat_gateway0" {
    allocation_id = aws_eip.elastic_ip0.id
    subnet_id = aws_subnet.subnet_public0.id
    depends_on = [aws_internet_gateway.internet_gateway]

    tags = {
        "Name" = "c_kurita"
    }
}

resource "aws_nat_gateway" "nat_gateway1" {
    allocation_id = aws_eip.elastic_ip1.id
    subnet_id = aws_subnet.subnet_public1.id
    depends_on = [aws_internet_gateway.internet_gateway]

    tags = {
        "Name" = "c_kurita"
    }
}