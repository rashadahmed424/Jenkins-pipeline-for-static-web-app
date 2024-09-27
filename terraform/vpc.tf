resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16" 
  }

resource "aws_subnet" "my_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  map_public_ip_on_launch = true
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  
}

resource "aws_internet_gateway" "my_gateway" {
  vpc_id = aws_vpc.my_vpc.id

}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_gateway.id
  }

 
}

resource "aws_route_table_association" "example_rta" {
  subnet_id      = aws_subnet.my_subnet.id
  route_table_id = aws_route_table.my_route_table.id
}





#to use aws default routetable instead of creating one :
#resource "aws_vpc" "my_vpc" {
#  cidr_block = "10.0.0.0/16"
#}

#resource "aws_subnet" "my_subnet" {
#  vpc_id                 = aws_vpc.my_vpc.id
#  map_public_ip_on_launch = true
#  cidr_block             = "10.0.1.0/24"
#  availability_zone      = "us-east-1a"
#}

#resource "aws_internet_gateway" "my_gateway" {
#  vpc_id = aws_vpc.my_vpc.id
#}

# Modify the default route table instead of creating a new one
#resource "aws_default_route_table" "default" {
#  default_route_table_id = aws_vpc.my_vpc.default_route_table_id

#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.my_gateway.id
#  }
#}
