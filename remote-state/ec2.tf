resource "aws_instance" "db" {
  ami           = var.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = ["sg-087068de447654b44"]
  tags = var.tags

}