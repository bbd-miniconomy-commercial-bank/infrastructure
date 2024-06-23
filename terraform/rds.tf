resource "aws_security_group" "rds" {
  vpc_id = module.vpc.vpc_id
  ingress {
    description = "RDS Postgres Access from Anywhere"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

module "rds" {
  source                      = "terraform-aws-modules/rds/aws"
  identifier                  = "noinfluence"
  family                      = "postgres16"
  db_name                     = "noinfluenceprod"
  engine                      = "postgres"
  instance_class              = "db.t3.micro"
  create_db_instance          = true
  allocated_storage           = 20
  deletion_protection         = false
  skip_final_snapshot         = true
  db_subnet_group_name        = module.vpc.database_subnet_group_name
  vpc_security_group_ids      = [aws_security_group.rds.id]
  publicly_accessible         = true
  username                    = "adminuser"
  port                        = 5432
  manage_master_user_password = true
}