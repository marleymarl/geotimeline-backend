resource "random_password" "rds" {
  length  = 35
  special = false
}

resource "aws_db_instance" "rds" {
  name                    = "geotimeline"
  identifier              = "geotimeline-db"
  instance_class          = var.rds_class
  allocated_storage       = var.rds_storage
  backup_retention_period = var.rds_backup_retention
  engine                  = var.rds_engine
  engine_version          = var.rds_version
  username                = var.rds_username
  password                = random_password.rds.result
  multi_az                = false
  publicly_accessible     = true
  skip_final_snapshot     = true
  //db_subnet_group_name    = aws_db_subnet_group.rds.name
  //vpc_security_group_ids = []

  allow_major_version_upgrade = true
  auto_minor_version_upgrade  = true

  tags = {
    Terraformed = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}
