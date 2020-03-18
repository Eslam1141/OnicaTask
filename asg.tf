resource "aws_launch_configuration" "EMI-lc" {
  name            = "EMI-lc"
  image_id        = "ami-0fc20dd1da406780b"
  instance_type   = "t2.micro"
  key_name        = "${aws_key_pair.terrademo.key_name}"
  security_groups = ["${aws_security_group.EMI_sg.id}"]
 
  user_data = "${file("userdata.sh")}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "EMI-asg" {
  name                      = "EMI-asg"
  health_check_grace_period = 300
  health_check_type         = "EC2"
  launch_configuration      = "${aws_launch_configuration.EMI-lc.name}"
  max_size                  = 3
  min_size                  = 1
  desired_capacity          = 2
  load_balancers       	    = ["${aws_elb.EMI-elb.name}"]
  vpc_zone_identifier       = ["${aws_subnet.EMI-subnet-public-1.id}","${aws_subnet.EMI-subnet-public-2.id}","${aws_subnet.EMI-subnet-public-3.id}"]

  tag {
    key                 = "Name"
    value               = "EMI-node"
    propagate_at_launch = true
  }

  lifecycle {
    create_before_destroy = true
  }

  depends_on = ["aws_launch_configuration.EMI-lc"]
}

resource "aws_autoscaling_policy" "EMI-asg-scaling-up" {
  name                   = "EMI-scale_up"
  autoscaling_group_name = "${aws_autoscaling_group.EMI-asg.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = 1
}

resource "aws_autoscaling_policy" "EMI-asg-scaling-down" {
  name                   = "EMI-scale_down"
  autoscaling_group_name = "${aws_autoscaling_group.EMI-asg.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = -1
}

