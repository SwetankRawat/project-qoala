resource "aws_alb" "my_alb" {
  name            = "my-alb"
  security_groups = [aws_security_group.alb_security_group.id]
  subnets         = [aws_subnet.public_subnet_1.id]
}

resource "aws_alb_target_group" "my_target_group" {
  name     = "my-target-group"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.vpc_name.id

  health_check {
    path                = "/health"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
    matcher             = "200-299"
  }
}

resource "aws_alb_listener" "my_listener" {
  load_balancer_arn = aws_alb.my_alb.arn
  port              = "80"
  protocol          =  aws_vpc.vpc_name.id

  default_action {
    target_group_arn = aws_alb_target_group.my_target_group.arn
    type             = "forward"
  }
}

resource "aws_security_group" "alb_security_group" {
  name        = "alb-security-group"
  description = "Allow HTTP traffic to ALB"
  vpc_id      = aws_vpc.vpc_name.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_subnet" "public_subnet_1" {
  availability_zone = "ap-south-1a"
  vpc_id       = aws_vpc.vpc_name.id
}