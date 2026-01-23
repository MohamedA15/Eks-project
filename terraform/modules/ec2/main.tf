data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

resource "aws_instance" "bastion" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids       = [aws_security_group.bastion.id]
  iam_instance_profile         = aws_iam_instance_profile.bastion.name
  associate_public_ip_address  = true
  key_name                    = var.key_name

  tags = {
    Name = "${var.name}-bastion"
  }
}
