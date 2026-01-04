resource "aws_instance" "webserver" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  associate_public_ip_address = true
    vpc_security_group_ids      = [aws_security_group.web_sg.id]

  tags = {
    Name   = var.app_name
    region = var.aws_region
  }
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"
  tags = {
    Name = "public-subnet"
    Tier = "public"
  }
}

resource "aws_subnet" "private_a" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "private-subnet-a"
    Tier = "db"
  }
}
resource "aws_subnet" "private_b" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "private-subnet-b"
    Tier = "db"
  }
}
resource "aws_db_subnet_group" "web_db_subnet_group" {
  name        = "web-db-subnet-group"
  description = "Subnet group for web application database"

  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]
}

resource "aws_db_instance" "my_database" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.web_db_subnet_group.name
    vpc_security_group_ids = [aws_security_group.db_sg.id]
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
  subnet_id      = data.aws_subnets.public.id
  route_table_id = aws_route_table.rt.id
}
