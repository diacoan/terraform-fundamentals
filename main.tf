provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "helloworld" {
  #ubuntu ami
  #ami           = "ami-023adaba598e661ac"
 
  #debian ami
  ami = "ami-042e6fdb154c830c5"
  instance_type = "t2.micro"
  tags = {
    Name = "Hello World"
    Course= "TF fundamentals"
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_security_group" "fw-rule-ingress" {
        name = "terraform-example-instance"
        ingress {
                from_port = 22
                to_port = 22
                protocol = "tcp"
                cidr_blocks = ["0.0.0.0/0"]
        }
}
