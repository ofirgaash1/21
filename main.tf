provider "aws" {
  region = var.region
}

resource "aws_instance" "web" {
  ami                    = "ami-0c55b159cbfafe1f0" 
  instance_type          = "t2.micro"
  subnet_id              = var.subnet_ids[0]
  vpc_security_group_ids = [var.security_group_id]
  key_name               = "imtec"  

  tags = {
    Name = "${var.service_name}-ec2"
  }
}

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnet_ids
  tags = {
    Name = "rds-subnet-group"
  }
}

resource "aws_db_instance" "mysql" {
  identifier              = "ofir-mysql-db"
  engine                  = "mysql"
  instance_class          = "db.t3.micro"
  username                = "admin"
  password                = "aA123456"
  allocated_storage       = 20
  db_subnet_group_name    = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [var.security_group_id]
  skip_final_snapshot     = true
  publicly_accessible     = false
  multi_az                = false
  deletion_protection     = false
}
