resource "aws_rds_global_cluster" "base_global" {
    global_cluster_identifier = var.db_name
    engine = "aurora-postgresql"
    engine_version = "11.9"
    database_name = "db${var.db_name}"
}

resource "aws_rds_cluster" "primary" {
    provider = aws.primary
    engine = aws_rds_global_cluster.base_global.engine
    engine_version =  aws_rds_global_cluster.base_global.engine_version
    cluster_identifier = "primary-cluster"
    master_username = "masteruser"
    master_password = "example123"
    database_name = aws_rds_global_cluster.base_global.database_name
    global_cluster_identifier = aws_rds_global_cluster.base_global.id
    db_subnet_group_name = "vpc-banca-digital-prod"
    skip_final_snapshot = true
    final_snapshot_identifier = "snapshot"
}


resource "aws_rds_cluster_instance" "db_primary" {
  provider = aws.primary
  engine = aws_rds_global_cluster.base_global.engine
  engine_version =  aws_rds_global_cluster.base_global.engine_version
  cluster_identifier = aws_rds_cluster.primary.id
  db_subnet_group_name = aws_rds_cluster.primary.db_subnet_group_name
  instance_class = "db.r4.large"
}



resource "aws_rds_cluster" "secondary" {
    provider = aws.secondary
    engine = aws_rds_global_cluster.base_global.engine
    engine_version =  aws_rds_global_cluster.base_global.engine_version
    cluster_identifier = "secondary-cluster"
    global_cluster_identifier = aws_rds_global_cluster.base_global.id
    db_subnet_group_name = "vpc-banca-digital-prod-cob"
    depends_on = [ aws_rds_cluster_instance.db_primary ]
    skip_final_snapshot = true
    final_snapshot_identifier = "snapshot"
}

resource "aws_rds_cluster_instance" "db_secondary" {
  provider = aws.secondary
  engine = aws_rds_global_cluster.base_global.engine
  engine_version =  aws_rds_global_cluster.base_global.engine_version
  cluster_identifier = aws_rds_cluster.secondary.id
  db_subnet_group_name = aws_rds_cluster.secondary.db_subnet_group_name
  instance_class = "db.r4.large"
}


