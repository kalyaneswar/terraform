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

variable "instance_name" {
    default = "backend"
    }
  
