resource "aws_security_group" "this" {
  name        = var.app_name
  description = "Ingress for ${var.app_name}"
  vpc_id      = var.vpc_id
  tags        = var.tags

  dynamic "ingress" {
    iterator = port
    for_each = var.ingress_ports
    content {
      description = "ingress rules for ${var.app_name} "
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

