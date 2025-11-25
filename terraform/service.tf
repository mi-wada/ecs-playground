resource "aws_security_group" "private" {
  vpc_id      = aws_vpc.main.id
  name        = "ecsp-private"
  description = "escp / for private web server"
}

resource "aws_vpc_security_group_ingress_rule" "private_allow_private_inbound" {
  security_group_id = aws_security_group.private.id
  cidr_ipv4         = "10.0.0.0/16"
  ip_protocol       = "tcp"
  from_port         = 80
  to_port           = 80
}

resource "aws_vpc_security_group_egress_rule" "private_allow_all_outbound" {
  security_group_id = aws_security_group.private.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1"
}
