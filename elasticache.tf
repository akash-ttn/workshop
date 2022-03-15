#Elasticache Security Group

resource "aws_security_group" "workshop_elasticache_sg" {
    name = "Workshop Elasticache Security Group"
    vpc_id = aws_vpc.workshop-vpc.id
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [
            "0.0.0.0/0"
        ]
    }
    ingress {
        from_port = 6379
        to_port = 6379
        protocol = "tcp"
        security_groups = [aws_security_group.workshop_asg_sg.id]
    }
    tags = {
        Name = "Workshop Elasticache Security Group"
        Terraform = "True"
    }
}

#Elasticache subnet group

resource "aws_elasticache_subnet_group" "workshop_elasticache_subnet" {
    name = "Workshop-Elasticache-Subnet-Group"
    subnet_ids = [
        aws_subnet.workshop-private-1a.id,
        aws_subnet.workshop-private-1b.id
    ]
}

#Create elasticache replication group

resource "aws_elasticache_replication_group" "workshop_elasticache" {
    automatic_failover_enabled = "true"
    replication_group_id = "workshop-replication-group"
    replication_group_description = "workshop-elasticache-group"
    node_type = "cache.t2.micro"
    number_cache_clusters = 2
    engine_version = "5.0.4"
    parameter_group_name = "default.redis5.0"
    port = 6379
    subnet_group_name = aws_elasticache_subnet_group.workshop_elasticache_subnet.name
    security_group_ids = [
        aws_security_group.workshop_elasticache_sg.id 
    ]
    tags = {
        Name = "Workshop Elasticache Replication Group"
        Terraform = "True"
    }
}