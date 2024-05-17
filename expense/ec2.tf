
resource "aws_instance" "expense" {
  count = length(var.instance_names)
  ami           = var.image_id
  instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = merge(
    var.common_tags,

    {
        Name = var.instance_names[count.index]
        Module = var.instance_names[count.index]
    }

  
  )
      

}

# resource "<resource_type>" "<resource_name>"
resource "aws_security_group" "allow_ssh" {
    name        = var.sg_name
    description = var.sg_description

    # Inbound
    ingress {
        from_port        = var.ssh_port
        to_port          = var.ssh_port
        protocol         = var.protocol
        cidr_blocks      = var.allowed_cidr
    }

    # Outbound
    egress {
        from_port        = 0 # from 0 t0 0 menas, opening all protocals{0 usually means you're opening all ports, which effectively allows traffic for all protocols.}
        to_port          = 0
        protocol         = "-1" #typically indicates that all protocols are allowed. "-1" is often used as a wildcard value to denote that traffic for any protocol is permitted. 
        cidr_blocks      = var.allowed_cidr
    }

    tags = {
        Name = "allow_ssh"
        CreatedBy = "Kalyan"
  }

}


