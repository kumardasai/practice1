provider "aws" {
  # Configuration options
}

resource "aws_vpc" "ntier" {
    cidr_block = "192.168.0.0/16"
    tags = {
        Name = "ntier"
    }
}

resource "aws_subnet" "app1" {
    cidr_block = "192.168.1.0/24"
    availability_zone = "us-east-1a"
    vpc_id = aws_vpc.ntier.id
    tags = {
        Name = "ntier_subnet1"
    }
}

resource "aws_subnet" "app2" {
	cidr_block = "192.168.2.0/24"
	availability_zone = "us-east-1a"
	vpc_id = aws_vpc.ntier.id
	tags = {
			Name = "ntier_subnet2"
		}

}

resource "aws_instance" "web" {
	ami = "ami-0557a15b87f6559cf"
	instance_type = "t2.micro"
	tags = {
		Name = "TerraformEc2"
	}
}

#Assuming an IAM Role
#If provided with a role ARN, the AWS Provider will attempt to assume this role using the supplied credentials.
#Usage:
#provider "aws" {
#  assume_role {
#    role_arn     = "arn:aws:iam::123456789012:role/ROLE_NAME"
#    session_name = "SESSION_NAME"
#    external_id  = "EXTERNAL_ID"
#  }
#}
