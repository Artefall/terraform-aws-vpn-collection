provider "aws" {
    region = var.region
    access_key = var.access_key
    secret_key = var.secret_key
}

data "aws_ami" "ubuntu_server_image_latest" {
    owners = ["099720109477"]
    most_recent = true

    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-*"]
    }
}

resource "aws_instance" "vpn_machine" {
    count = 1

    instance_type = var.instance_type
    ami = data.aws_ami.ubuntu_server_image_latest.id

    security_groups = [ aws_security_group.this.name ]
    tags = {
        Name = var.virtual_machine_host_name
    }
}

resource "aws_eip" "this" {
    instance = aws_instance.vpn_machine[0].id
    vpc = false
}

resource "aws_security_group" "this" {
    name = "Allow VPN connections"
    description = "Allow VPN connections for this host"

    ingress {
        description = "Open VPN port"
        from_port = 1723
        to_port = 1723
        protocol = "tcp"
    }

    tags = {
        Name = "Allow VPN connection"
    }
}
