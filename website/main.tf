resource "aws_instance" "webserver" {
  ami = data.aws_ami.amazon_linux.id
    instance_type = "t3.micro"
    tags = {
      Name = var.app_name
      region = var.aws_region
    }
}