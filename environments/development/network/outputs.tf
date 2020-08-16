##################################################
# VPC Resources
##################################################
output "vpc" {
  value = aws_vpc.vpc
}


##################################################
# Elastic IP
##################################################
output "elastic_ip0" {
  value = aws_eip.elastic_ip0.public_ip
}

output "elastic_ip1" {
  value = aws_eip.elastic_ip1.public_ip
}

##################################################
# Security groups
##################################################
output "http_sg" {
  value = module.http_sg
}

output "https_sg" {
  value = module.https_sg
}

output "http_redirect_sg" {
  value = module.http_redirect_sg
}

output "nginx_sg" {
  value = module.nginx_sg
}