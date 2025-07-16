data "aws_ami" "amazon-linux-3" { //we can read all resources from aws using data block.like vpc and its subnet,database RDS, etc.
  most_recent = true

  filter {
    name   = "name"
    values = ["al2023-ami-2023*"] //here we are reading aws ami resource data using ami name we can use multiple another parameters.
    //that values reading from ami on aws.
  }

  # filter {
  #   name   = "owner-alias"
  #   values = ["amazon"]
  # }
  owners = ["amazon"] //owners variable is used to avoid filter block for owner alias block.

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  filter {
    name   = "architecture"
    values = ["x86_64"]
  }

}

resource "aws_instance" "dev-instance" {
  ami           = data.aws_ami.amazon-linux-3.id
  instance_type = var.instance_type
  count         = var.instance_count
  key_name      = var.instance_key

  tags = {
    Name        = "My Network"
    Environment = "Dev"
  }
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}