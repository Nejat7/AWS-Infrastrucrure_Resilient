resource "aws_security_group" "Mikias_SG" {
  name        = "allow_http"
  description = "Allow inbound network traffic"
  vpc_id      = aws_vpc.Mikias_vpc.id

  dynamic "ingress" {
    iterator = port
    for_each = var.service_ports
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress = [{
    description      = "for all outgoing traffics"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    prefix_list_ids  = []
    security_groups  = []
    self             = false
    }
  ]

}