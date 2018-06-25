#################### Security Group ########################

resource "aws_security_group" "rvg_test" {
  name = "rvg_test"
  description = "default VPC security group"

  # inbound TCP access
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # inbound HTTP access
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

  # outbound ALL traffic
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


#################### Instances ###########################

resource "aws_instance" "inbox-test" {
  ami = "ami-01d5756f"
  instance_type = "t2.micro"
  count = 2   
  key_name = "bonial"
  security_groups = ["rvg_test"]
}

################### ELB ######################################

resource "aws_elb" "inbox-test" {
  name = "rvg-inbox-test"

  # The same availability zone
  availability_zones = ["ap-northeast-2a", "ap-northeast-2c"]

  security_groups = ["${aws_security_group.rvg_test.id}"]

  listener {
    instance_port = 80
    instance_protocol = "http"
    lb_port = 80
    lb_protocol = "http"
  }

  health_check {
    healthy_threshold = 2
    unhealthy_threshold = 2
    target = "HTTP:80/index.html"
    interval = 10
    timeout = 2
  }
}
