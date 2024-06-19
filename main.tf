provider "aws" {
  region = "eu-central-1"
}


resource "aws_instance" "helloworld" {
  #ubuntu ami
  #ami           = "ami-023adaba598e661ac"

  #debian ami
  ami           = "ami-042e6fdb154c830c5"
  instance_type = "t2.micro"
  tags = {
    Name   = "Hello World"
    Course = "TF fundamentals"
  }
  vpc_security_group_ids = [aws_security_group.fw-rule-ingress.id, aws_security_group.fw-web-rule-ingress.id]
  key_name =  aws_key_pair.inst-ssh-key.id 
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_security_group" "fw-rule-ingress" {
  name = "terraform-example-instance"
  tags = {
    Purpose = "allow-ssh"
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH"
  }
}

resource "aws_security_group" "fw-web-rule-ingress" {
  name = "terraform-web=ingress"
  tags = {
    Purpose = "allow-ssh"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "WEB"
  }
}


resource "aws_key_pair" "inst-ssh-key" {
 key_name = "module-deployer-key"
 public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIER4aFfE48BHDQQyFTLdvMWagMf7qSBG68aNDxf3Xzr0 student@oana-9l0t"
}