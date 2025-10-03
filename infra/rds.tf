# RDS PostgreSQL Database (Data Store for the SaaS)
resource "aws_db_instance" "app_db" {
  identifier           = "spender-guardian-db"
  engine               = "postgres"
  engine_version       = "15.2"
  instance_class       = "db.t3.micro"
  allocated_storage    = 20
  db_name              = "spenderdb"
  username             = "pgadmin"
  password             = var.db_password
  skip_final_snapshot  = true

  # CRITICAL: In a real environment, you must specify VPC subnets and security groups here.
  # For MVP, we rely on default settings, but production requires specific networking!
  # publicly_accessible = false
}