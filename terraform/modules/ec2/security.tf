resource "aws_security_group" "bastion" {
  name        = "${var.name}-bastion-sg"
  description = "Security group for bastion instance"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
