resource "aws_lb" "alb" {
    name = "alb-test"
    load_balancer_type = "application"
    internal = false
    idle_timeout = 60
    enable_deletion_protection = false

    subnets = [
        aws_subnet.subnet_public0.id,
        aws_subnet.subnet_public1.id,
    ]

    security_groups = [
        module.http_sg.security_group_id,
        module.https_sg.security_group_id,
        module.http_redirect_sg.security_group_id,
    ]
}

output "alb_dns_name" {
    value       = aws_lb.alb.dns_name
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "fixed-response"

    fixed_response {
        content_type = "text/plain"
        message_body = "これは「HTTP」です！"
        status_code = 200
    }
  }
}

resource "aws_alb_listener_rule" "rule_10" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 10

  action {
    type             = "fixed-response"
    fixed_response {
        content_type = "text/plain"
        message_body = "これは「rule_10」です"
        status_code = 200
    }
  }

  condition {
    source_ip {
      values = ["113.37.56.146/32"]
    }
  }
}

resource "aws_alb_listener_rule" "rule_100" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 100

  action {
    type             = "fixed-response"
    fixed_response {
        content_type = "text/plain"
        message_body = "これは「rule_100」です"
        status_code = 200
    }
  }
  condition {
    source_ip {
      values = ["113.43.73.18/32"]
    }
  }
}

resource "aws_alb_listener_rule" "rule_1000" {
  listener_arn = aws_lb_listener.http.arn
  priority     = 1000

  action {
    type             = "fixed-response"
    fixed_response {
        content_type = "text/plain"
        message_body = "これは「rule_1000」です"
        status_code = 200
    }
  }
  condition {
    source_ip {
      values = ["118.238.254.8/32"]
    }
  }
}