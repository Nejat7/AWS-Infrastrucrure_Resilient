aws_account_id    = "****"
user_account_role_arn = "****"

aws_region = "us-east-1"
azs           = ["us-east-1a", "us-east-1b"]
disk_space    = 8
elb_port      = 80
instance_ami  = "ami-033b95fb8079dc481"
instance_type = "t3a.micro"
max_size      = 5
min_size      = 2
server_port   = 80
service_ports = [80, 443]
subnets_cidr  = ["17.1.1.0/25", "17.1.2.0/25"]
volume_type   = "gp2"
vpc_cidr      = "17.1.0.0/16"
