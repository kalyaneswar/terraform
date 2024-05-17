locals {
  ami_id = "ami-090252cbe067a9e58"
  sg_id = "sg-087068de447654b44"
  instance_type = var.instance_name == "db" ? "t3.small" : "t3.micro"

  tags = {
    Name = "locals"
  }

}