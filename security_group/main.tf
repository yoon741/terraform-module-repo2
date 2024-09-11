resource "aws_security_group" "this" {
  name        = var.sg_name
  description = var.description

  ingress {
    description = "Allow MariaDB from aywhere"
    from_port = var.ingress_port
    to_port = var.ingress_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress { # 인바운드 규칙 2
    description = "Allow ssh from aywhere"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = var.sg_name
  }

}

