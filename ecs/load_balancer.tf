resource "aws_security_group" "lb" {
  name   = format("%s-load-balancer", var.project_name)
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "ingress_80" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  description       = "Liberando porta 80"
  protocol          = "tcp"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
}

resource "aws_security_group_rule" "ingress_443" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  description       = "Liberando porta 443"
  protocol          = "tcp"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
}

resource "aws_lb" "main" {
  name               = format("%s-ingress", var.project_name)
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb.id]

  subnets = var.public_subnets

  enable_cross_zone_load_balancing = false
  enable_deletion_protection       = false
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "Curso LinuxTips"
      status_code  = "200"
    }
  }
}