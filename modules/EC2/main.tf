data "aws_ami" "aws_linux_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023.4.20240528.0-kernel-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["137112412989"]
}

resource "aws_instance" "EC_instance" {

  ami           = data.aws_ami.aws_linux_ami.id
  instance_type = "t2.micro"
  monitoring    = true

  tags = {
    Name      = "terraform-ec2-instance"
    terraform = true
  }

}