data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

resource "aws_instance" "web" {
  count = length(local.instances)

  ami           = data.aws_ami.ubuntu.id
  instance_type = local.instances[count.index].instance_type
  key_name      = local.instances[count.index].key_name

  subnet_id              = local.instances[count.index].subnet_id
  vpc_security_group_ids = var.security_groups

  associate_public_ip_address = true

  tags = {
    Name       = "${local.instances[count.index].name}-${local.instances[count.index].index + 1}"
    Managed_by = "terraform"
  }
}
