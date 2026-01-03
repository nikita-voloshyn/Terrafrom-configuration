data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_vpc" "main" {
    filter {
      name = "tag:Name"
      values = ["main_vpc"]
    }
}

data "aws_subnets" "public" {

    filter {
      name = "vpc-id"
      values = [data.aws_vpc.main.id]
    }

  filter {
    name   = "tag:Tier"
    values = ["web"]
  }
}


