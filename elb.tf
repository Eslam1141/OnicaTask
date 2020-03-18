resource "aws_elb" "EMI-elb" {
  name               = "EMI-elb"
 # availability_zones = ["us-east-2a", "us-east-2b", "us-east-2c"]
  subnets            = ["${aws_subnet.EMI-subnet-public-1.id}","${aws_subnet.EMI-subnet-public-2.id}","${aws_subnet.EMI-subnet-public-3.id}"]
  security_groups    = ["${aws_security_group.EMI_sg.id}"]
  
  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    target              = "HTTP:80/"
    interval            = 30
  }

  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  tags = {
    Name = "EMI-elb"
  }
}
