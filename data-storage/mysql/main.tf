provider "aws" {
    region = "us-east-1"
}

resource "aws_db_instance" "example_db" {
  allocated_storage    = 10
  db_name              = "example_db"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
}

