
provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west-2"
  region = "us-west-2"
}

data "aws_ami" "us_east_1" {
  provider = aws.us-east-1
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]  # AWS Account ID for Canonical
}

data "aws_ami" "us_west_2" {
  provider = aws.us-west-2
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]  # AWS Account ID for Canonical
}

resource "aws_instance" "instance_us_east_1" {
  provider = aws.us-east-1
  ami           = data.aws_ami.us_east_1.id
  instance_type = "t2.micro"
  tags = {
    Name = "Instance-us-east-1"
  }
}

resource "aws_instance" "instance_us_west_2" {
  provider = aws.us-west-2
  ami           = data.aws_ami.us_west_2.id
  instance_type = "t2.micro"
  tags = {
    Name = "Instance-us-west-2"
  }
}

