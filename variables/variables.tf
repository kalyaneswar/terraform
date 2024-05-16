variable "image_id" {
  type = string  #optional
  default = "ami-090252cbe067a9e58" #optional
  description = "RHEL -9 AMI ID" #optional
}

variable "instance_type" {
  type = string  #optional
  default = "t3.micro" #optional
  description = "RHEL -9 t3 micro" #optional
}

variable "tags" {
    default = {
        Project = "Expense"
        Enviroment = "Dev"
        Module = "DB"
        Name = "DB"
    }
  
}

variable "sg_name" {
    default = "allow_ssh"
  
}

variable "sg_description" {
    default = "allow port 22"
  
}

variable "ssh_port" {
    default = 22
  
}

variable "protocol" {
    type = string
    default = "tcp"
  
}

variable "allowed_cidr" {
    type = list(string)
    default = ["0.0.0.0/0"]
  
}