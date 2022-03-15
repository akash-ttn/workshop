# Creating bastion host SG for ssh

resource "aws_security_group" "workshop-bastion-sg" {
    vpc_id = aws_vpc.workshop-vpc.id 
    name = "Bastion Host Security Group"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ 
            "0.0.0.0/0"
        ]
    }
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ 
            "0.0.0.0/0"
        ]
    }
    tags = {
        Name = "Workshop Bastion SG"
        Terraform = "True"
    }
}

#Create bastion host in EU-West-1A Public subnet

resource "aws_instance" "workshop_bastion_host-1a" {
    ami = "ami-08ca3fed11864d6bb"
    instance_type = "t2.micro"
    key_name = aws_key_pair.ssh-key.key_name 
    associate_public_ip_address = true 
    vpc_security_group_ids = [aws_security_group.workshop-bastion-sg.id]
    subnet_id = aws_subnet.workshop-public-1a.id 
    tags = {
        Name = "Workshop Bastion Host - 1A"
        Terraform = "True"
    }
}

#Create bastion host in EU-West-1B Public subnet

resource "aws_instance" "workshop_bastion_host-1b" {
    ami = "ami-08ca3fed11864d6bb"
    instance_type = "t2.micro"
    key_name = aws_key_pair.ssh-key.key_name 
    associate_public_ip_address = true 
    vpc_security_group_ids = [aws_security_group.workshop-bastion-sg.id]
    subnet_id = aws_subnet.workshop-public-1b.id 
    tags = {
        Name = "Workshop Bastion Host - 1B"
        Terraform = "True"
    }
}