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
}