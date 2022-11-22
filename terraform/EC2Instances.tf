resource "aws_instance" "webServers" {
  count           = length(var.subnets_cidr)
  ami             = var.instance_ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.Mikias_SG.id]
  subnet_id       = element(aws_subnet.public_subnet.*.id, count.index)
  user_data       = file("ec2_apache.sh")

  root_block_device {
    volume_size           = var.disk_space
    volume_type           = var.volume_type
    delete_on_termination = true
  }


  tags = {
    "Name" = "webServer"
    "OS"   = "Linux2"
  }
}