resource "aws_vpc" "EMI-vpc" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = "true" #gives you an internal domain name
    enable_dns_hostnames = "true" #gives you an internal host name
    enable_classiclink = "false"
    instance_tenancy = "default"    
    
    tags {
        Name = "EMI-vpc"
    }
}
resource "aws_subnet" "EMI-subnet-public-1" {
    vpc_id = "${aws_vpc.EMI-vpc.id}"
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "false" //it makes this a public subnet
    availability_zone = "us-east-2a"
    tags {
        Name = "EMI-subnet-public-1"
    }
}
resource "aws_subnet" "EMI-subnet-public-2" {
    vpc_id = "${aws_vpc.EMI-vpc.id}"
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "false" //it makes this a public subnet
    availability_zone = "us-east-2b"
    tags {
        Name = "EMI-subnet-public-2"
    }
}
resource "aws_subnet" "EMI-subnet-public-3" {
    vpc_id = "${aws_vpc.EMI-vpc.id}"
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "false" //it makes this a public subnet
    availability_zone = "us-east-2c"
    tags {
        Name = "EMI-subnet-public-3"
    }
}


