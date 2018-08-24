terraform {
  required_version = "> 0.11.0"

  backend "s3" {
    bucket = "terraform-dinopractica"
    key    = "tf.state"
    region  = "us-west-2"
  }
}

provider "aws" {
  shared_credentials_file = "/Users/tf_user/.aws/creds"
  region     = "us-west-2"
}


resource "aws_vcp" "main" {
  cidr_block = "10.0.0.0/16"
  tags {
    Name = "dinopractica"
  }
}

resource "aws_subnet" "subnet_public" {
  vpc_id = "${aws_vcp.main.id}"
  cidr_block = "10.0.2.0/24"

  tags {
    Name = "subnet_public"
  }
}

resource "aws_subnet" "subnet_private" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "10.0.1.0/24"

  tags {
    Name = "subnet_private"
  }
}
