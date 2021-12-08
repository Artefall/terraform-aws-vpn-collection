data "aws_ami" "ubuntu_server_image_latest" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
  }
}

resource "tls_private_key" "this" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "this"{
  key_name = "ssh-key"
  public_key = tls_private_key.this.public_key_openssh
}

resource "aws_instance" "this" {
  count = 1

  instance_type = var.instance_type
  ami           = data.aws_ami.ubuntu_server_image_latest.id

  user_data = templatefile("${path.module}/user_data/initialization.sh.tpl", {
    pptp_config = local.pptp_config_content,
    chap_secrets = local.chap_secrets_content,
    pptpd_options = local.pptpd_options_content
  })

  security_groups = [aws_security_group.this.name]
  tags = {
    Name = "PPTP VPN Host"
  }
}

resource "aws_eip" "this" {
  instance = aws_instance.this[0].id
  vpc      = false
}

resource "aws_security_group" "this" {
  name        = "Allow VPN connections"
  description = "Allow VPN connections for this host"

  ingress {
    description = "Open VPN port"
    from_port   = 1723
    to_port     = 1723
    protocol    = "tcp"
  }

  tags = {
    Name = "Allow VPN connection"
  }
}