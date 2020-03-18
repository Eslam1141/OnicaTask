resource "aws_internet_gateway" "EMI-igw" {
    vpc_id = "${aws_vpc.EMI-vpc.id}"
    tags {
        Name = "EMI-igw"
    }
}

resource "aws_route_table" "EMI-public-crt" {
    vpc_id = "${aws_vpc.EMI-vpc.id}"
    
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = "${aws_internet_gateway.EMI-igw.id}" 
    }
    
    tags {
        Name = "EMI-public-crt"
    }
}
resource "aws_route_table_association" "EMI-crta-public-subnet-1"{
    subnet_id = "${aws_subnet.EMI-subnet-public-1.id}"
    route_table_id = "${aws_route_table.EMI-public-crt.id}"
}

resource "aws_route_table_association" "EMI-crta-public-subnet-2"{
    subnet_id = "${aws_subnet.EMI-subnet-public-2.id}"
    route_table_id = "${aws_route_table.EMI-public-crt.id}"
}
resource "aws_route_table_association" "EMI-crta-public-subnet-3"{
    subnet_id = "${aws_subnet.EMI-subnet-public-3.id}"
    route_table_id = "${aws_route_table.EMI-public-crt.id}"
}