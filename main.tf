provider "aws" {
  region = ""
  access_key = "" 
  secret_key = ""
}

resource "aws_instance" "training_ec2"{
    ami = "ami-04394a3a96907e9ec"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.sridhar_sg.id]
    tags={
        "nandhan"="dummy terra"
    }
}

resource "aws_security_group" "sridhar_sg"{
    name ="sridhar_sg"
    description = "testing purpose"
    ingress{
        from_port = 22
        to_port   =22
         protocol ="tcp"
         cidr_blocks = ["0.0.0.0/0"]
    }
}