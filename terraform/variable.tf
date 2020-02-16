data "aws_region" "current" {}

locals {
  # プロジェクト名
  project_name = "raisetechinfrastructure"

  # Route 53 ドメイン名(freenomで取得済)
  domain_name    = "raisetechportfolio.tk"
  subdomain_name = "www"

  # VPC Classless Inter-Domain Routing(cidr)
  vpc_cidr                   = "10.0.0.0/16"
  vpc_subnet_public_1a_cidr  = "10.0.1.0/24"
  vpc_subnet_public_1c_cidr  = "10.0.2.0/24"
  vpc_subnet_private_1a_cidr = "10.0.11.0/24"
  vpc_subnet_private_1c_cidr = "10.0.12.0/24"

  # ロードバランサー
  lb-accesslog-bucket-name = "raisetechportfolio-accesslog-bucket"

  # RDS(MySQL) パスワードはSSMで暗号化して管理
  db_identifier                = "raisetechdbinstance"
  db_username                  = "RaiseTechUser"
  db_engine_version            = "5.7"
  db_instance_class            = "db.t2.micro"
  db_parameter_group_name      = "default.mysql5.7"
  db_final_snapshot_identifier = "raisetechfinalidentifier"

  # EC2 AMIは自作したもの(private)
  ec2_base_ami      = "ami-03221ff557052673d"
  ec2_instance_type = "t2.small"
  ec2_key_name      = "RaiseTechKeyPair"
}