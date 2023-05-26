# Provider configuration
provider "aws" {
  region = "us-east-1"  # Desired AWS region
}

# Variables
variable "vpc_cidr_block" {}
variable "env_prefix" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "public_key_location" {}

# VPC configuration
resource "aws_vpc" "Nabeel_VPC" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = "${var.env_prefix}-vpc"
        }
}

# Subnet configuration
resource "aws_subnet" "Nabeel_sb1" {
  vpc_id                  = aws_vpc.Nabeel_VPC.id
  cidr_block              = var.subnet_cidr_block  # Desired subnet CIDR block
  availability_zone       = var.avail_zone  # Desired availability zone in the chosen region

  tags = {
    Name = "${var.env_prefix}-subnet-1"
  }
}

# Internet Gateway configuration
resource "aws_internet_gateway" "Nabeel_igw" {
  vpc_id = aws_vpc.Nabeel_VPC.id

  tags = {
    Name = "${var.env_prefix}-igw"
  }
}

# Route Table configuration
resource "aws_route_table" "Nabeel-rtb" {
    vpc_id = aws_vpc.Nabeel_VPC.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.Nabeel_igw.id
        }
    tags = {
        Name = "${var.env_prefix}-Nabeel-rtb"
        }
}

# Associate Subnet with Route Table
resource "aws_route_table_association" "Nabeel_subnet_association" {
    subnet_id = aws_subnet.Nabeel_sb1.id
    route_table_id = aws_route_table.Nabeel-rtb.id
}

# Security Group configuration
resource "aws_security_group" "Nabeel_sg" {
    vpc_id = aws_vpc.Nabeel_VPC.id

    # Ingress rules (allow inbound traffic)
    ingress {
        from_port   = 22  # Allow SSH access
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]  # Allow access from anywhere
        }
    # Egress rules (allow outbound traffic)
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        prefix_list_ids = []
        }

}


# AMI Configuration
data "aws_ami" "latest-amazon-linux-image"{
    most_recent  = true
    owners = ["amazon"]

    filter{
        name = "name"
        values = ["amzn2-ami-hvm-*-x86_64-gp2"]
    }
    
    filter{
        name = "virtualization-type"
        values = ["hvm"]
    }
}
output "aws_ami_id" {
    value = data.aws_ami.latest-amazon-linux-image.id
}

resource "aws_key_pair" "ssh-key"{
    key_name = "server&client-key"
    public_key = file(var.public_key_location)

}


resource "aws_instance" "Nabeel_EC2_Server" {
    ami = data.aws_ami.latest-amazon-linux-image.id
    instance_type = "t2.micro"

    subnet_id = aws_subnet.Nabeel_sb1.id
    vpc_security_group_ids = [aws_security_group.Nabeel_sg.id]
    availability_zone = var.avail_zone

    associate_public_ip_address = true

    key_name = aws_key_pair.ssh-key.key_name

    tags = {
        Name = "${var.env_prefix}-server-ec2"
    }
}

resource "aws_instance" "Nabeel_EC2_Client" {
    ami = data.aws_ami.latest-amazon-linux-image.id
    instance_type = "t2.micro"

    subnet_id = aws_subnet.Nabeel_sb1.id
    vpc_security_group_ids = [aws_security_group.Nabeel_sg.id]
    availability_zone = var.avail_zone

    associate_public_ip_address = true

    key_name = aws_key_pair.ssh-key.key_name
    
    tags = {
        Name = "${var.env_prefix}-client-ec2"
    }
}





output "ec2_server_public_ip" {
    value = aws_instance.Nabeel_EC2_Server.public_ip
}

output "ec2_client_public_ip" {
    value = aws_instance.Nabeel_EC2_Client.public_ip
}
