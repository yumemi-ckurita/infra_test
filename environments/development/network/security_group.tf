module "http_sg" {
    source = "./../../../modules/security_group"
    name = "http-sg"
    vpc_id = aws_vpc.vpc.id
    port = 80
    cidr_blocks = ["0.0.0.0/0"]
}

module "https_sg" {
    source = "./../../../modules/security_group"
    name = "https-sg"
    vpc_id = aws_vpc.vpc.id
    port = 443
    cidr_blocks = ["0.0.0.0/0"]
}

module "http_redirect_sg" {
    source = "./../../../modules/security_group"
    name = "http-redirect-sg"
    vpc_id = aws_vpc.vpc.id
    port = 8080
    cidr_blocks = ["0.0.0.0/0"]
}

module "nginx_sg" {
    source = "./../../../modules/security_group"
    name = "nginx-sg"
    vpc_id = aws_vpc.vpc.id
    port = 80
    cidr_blocks = [aws_vpc.vpc.cidr_block]
}