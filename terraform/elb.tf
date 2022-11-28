# Creates load balancer
resource "aws_elb" "Nejat-elb" {
  name            = "Nejat-elb"
  subnets         = aws_subnet.public_subnet.*.id
  security_groups = [aws_security_group.Nejat_SG.id]

  listener {
    instance_port     = var.server_port
    instance_protocol = "http"
    lb_port           = var.elb_port
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = [aws_instance.webServers[0].id, aws_instance.webServers[1].id]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 300

  tags = {
    "Name" = "Nejat-terraform-elb"
  }
}

output "elb-dns-name" {
  value = aws_elb.Nejat-elb.dns_name
}