provider "aws" {
  access_key	= "AKIA36UX5RXW6A3HLO4L"
  secret_key	= "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"
  region 		= "us-east-1"
}

resource "aws_vpc" "terraform" {
  cidr_block		= "10.0.0.0/16"
  instance_tenancy	= "default"

  tags {
    Name = "terraform"
  }
 }

resource "aws_subnet" "terraform_subnet1" {
  vpc_id		= "${aws_vpc.terraform.id}"
  cidr_block	= "10.10.1.0/24"
  
  tags {
    Name = "terraform_subnet1"
  }

} 
