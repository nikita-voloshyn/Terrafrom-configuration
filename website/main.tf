resource "aws_instance" "webserver" {
  ami = data.aws_ami.amazon_linux.id
    instance_type = "t3.micro"
    subnet_id = aws_subnet.web_subnet.id
    associate_public_ip_address = true

    tags = {
      Name = var.app_name
      region = var.aws_region
    }
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "web_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
    tags = {
    Name = "web_subnet"
  }
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_assoc" {
    subnet_id      = aws_subnet.web_subnet.id
    route_table_id = aws_route_table.rt.id
}