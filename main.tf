provider "aws" {
    region = "us-east-1"
    
}

variable "cidr_blocks" {
    description = "cidr block for subnet and vpc"
    type = list(string)
}


resource "aws_vpc" "development-vpc" {
    cidr_block = var.cidr_blocks[0]
    tags = {
        Name: "development"
    }

}

resource "aws_subnet" "dev-subnet-1"{
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.cidr_blocks[1]
 
    availability_zone = "us-east-1a"
     tags = {
        Name: "subnet-1-dev"
    }
}
