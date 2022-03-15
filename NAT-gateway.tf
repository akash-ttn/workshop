#Creating an Elastic IP for Nat gateway

resource "aws_eip" "workshop-nat1" {}
resource "aws_eip" "workshop-nat2" {}

#Create NAT GW in EU-West-1A

resource "aws_nat_gateway" "workshop-nat-gateway-1a" {
    allocation_id = aws_eip.workshop-nat1.id
    subnet_id = aws_subnet.workshop-public-1a.id 
    tags = {
        Name = "NAT Gateway - 1A"
        Terraform = "True"
    }
}

#Create NAT GW in EU-West-1B

resource "aws_nat_gateway" "workshop-nat-gateway-1b" {
    allocation_id = aws_eip.workshop-nat2.id 
    subnet_id = aws_subnet.workshop-public-1b.id 
    tags = {
        Name = "NAT Gateway - 1B"
        Terraform = "True"
    }
}