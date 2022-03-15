resource "aws_lb_target_group" "workshop-front-end-tg" {
    port = 80
    protocol = "HTTP"
    name = "workshop-front-end-target-group"
    vpc_id = aws_vpc.workshop-vpc.id 
    stickiness {
      type = "lb_cookie"
      enabled = true
    }
    health_check {
        protocol = "HTTP"
        path = "/healthy.html"
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 5
        interval = 10
    }
    tags = {
        Name = "Workshop Target group"
        Terraform = "True"
    }
}