resource "aws_instance" "db" {
  ami           = "ami-090252cbe067a9e58"
  instance_type = "t3.micro"
  count = length(var.instance_name)
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = var.instance_name[count.index]
  }
}

resource "aws_security_group" "allow_ssh" {
    name        = "allow_ssh"
    description = "Allow ssh access"

    # Inbound
    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"]
    }

    # Outbound
    egress {
        from_port        = 0 # from 0 t0 0 menas, opening all protocals{0 usually means you're opening all ports, which effectively allows traffic for all protocols.}
        to_port          = 0
        protocol         = "-1" #typically indicates that all protocols are allowed. "-1" is often used as a wildcard value to denote that traffic for any protocol is permitted. 
        cidr_blocks      = ["0.0.0.0/0"]
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Kalyan"
  }

}