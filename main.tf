variable "AWS_ACCESS_KEY_ID" {
  type = string
  }

variable "AWS_SECRET_ACCESS_KEY" {
  type = string
  }

provider "aws" {
  region = "us-east-1"
  access_key = var.AWS_ACCESS_KEY_ID
  secret_key = var.AWS_SECRET_ACCESS_KEY
  }

resource "aws_s3_bucket" "bucket1" {
  bucket  = "sirius-bucket"
  acl     = "private"
  }



data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"] 

  filter {
    name   = "name"
    values = ["amzn-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }
}





resource "aws_instance" "web" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  
}



