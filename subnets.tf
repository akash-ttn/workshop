#PUBLIC SUBNETS

resource "aws_subnet" "workshop-public-1a" {
    vpc_id = aws_vpc.workshop-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "eu-west-1a"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "Workshop Public Subnet - 1A"
        Terraform = "True"
    }
}

resource "aws_subnet" "workshop-public-1b" {
    vpc_id = aws_vpc.workshop-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "eu-west-1b"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "Workshop Public Subnet - 1B"
        Terraform = "True"
    }
}

#PRIVATE SUBNETS

resource "aws_subnet" "workshop-private-1a" {
    vpc_id = aws_vpc.workshop-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "eu-west-1a"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "Workshop Private Subnet - 1A"
        Terraform = "True"
    }
}

resource "aws_subnet" "workshop-private-1b" {
    vpc_id = aws_vpc.workshop-vpc.id
    cidr_block = "10.0.4.0/24"
    availability_zone = "eu-west-1b"
    map_public_ip_on_launch = "false"
    tags = {
        Name = "Workshop Private Subnet - 1B"
        Terraform = "True"
    }
}