resource "aws_internet_gateway" "workshop-igw" {
    vpc_id = aws_vpc.workshop-vpc.id
    tags = {
        Name = "Workshop Internet Gateway"
        Terraform = "True"
    }
}