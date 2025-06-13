resource "aws_db_subnet_group" "saas_db_subnet" {
  name       = "saas-db-subnet"
  subnet_ids = aws_subnet.private[*].id

  tags = { Name = "saas-db-subnet" }
}


resource "aws_security_group" "rds_sg" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "rds-sg"
  }
}

resource "aws_db_instance" "saas_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.t3.micro"
  db_name                 = "saasdb"
  username             = "admin"
  password             = "YourStrongDBPassword1!" # Store this securely in real-world.
  db_subnet_group_name = aws_db_subnet_group.saas_db_subnet.name
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  skip_final_snapshot  = true

  tags = {
    Name = "saas-db"
  }
}
