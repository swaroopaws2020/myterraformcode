provider "aws" {
  region     = "${var.aws_region}"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
}

resource "aws_vpc" "myvpc-test" {
  cidr_block       = "${var.vpc_cidr}"
  enable_dns_hostnames = "true"

  tags = {
    Name = "${var.vpc_name}"
    Env = "${var.vpc_env_name}"
    Owner = "${var.owner_name}"
    
  }
}
  
resource "aws_internet_gateway" "myigw-1" {
    vpc_id = "${aws_vpc.myvpc-test.id}"

    tags = {
        Name = "${var.igw_name}"
        Env = "${var.igw_env_name}"
    }
  
}

resource "aws_subnet" "mysubnet_public-1" {
  vpc_id     = "${aws_vpc.myvpc-test.id}"
  cidr_block = "${var.subnet_cidr-1}"
  availability_zone = "${var.az1}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.subnet_name-1}"
    Env = "${var.subnet_env}"
  }
}

resource "aws_subnet" "mysubnet_public-2" {
  vpc_id     = "${aws_vpc.myvpc-test.id}"
  cidr_block = "${var.subnet_cidr-2}"
  availability_zone = "${var.az2}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.subnet_name-2}"
    Env = "${var.subnet_env}"
  }
}

resource "aws_subnet" "mysubnet_public-3" {
  vpc_id     = "${aws_vpc.myvpc-test.id}"
  cidr_block = "${var.subnet_cidr-3}"
  availability_zone = "${var.az3}"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "${var.subnet_name-3}"
    Env = "${var.subnet_env}"
  }
}

terraform {
  backend "s3" {
    bucket = "myterraform-code"
    key    = "myterraformcode.tfstate"
    region = "us-east-1"
  }
}
  


