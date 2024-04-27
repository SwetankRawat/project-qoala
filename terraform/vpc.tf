provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "vpc_name" {
  cidr_block = "10.10.0.0/18"
}

resource "aws_subnet" "public_subnet_1" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = "10.10.1.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = "10.10.2.0/24"
  availability_zone = "ap-south-1b"
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = "10.10.3.0/24"
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            = aws_vpc.vpc_name.id
  cidr_block        = "10.10.4.0/24"
  availability_zone = "ap-south-1b"
}
