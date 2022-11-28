resource "aws_launch_configuration" "asg-launch-config" {
  image_id        = var.instance_ami
  instance_type   = var.instance_type
  security_groups = [aws_security_group.Nejat_SG.id]
  user_data       = file("ec2_apache.sh")

  root_block_device {
    volume_size           = var.disk_space
    volume_type           = var.volume_type
    delete_on_termination = true
  }


  lifecycle {
    create_before_destroy = true
  }

}

resource "aws_autoscaling_group" "Nejat-asg" {
  name                 = "Nejat-asg"
  launch_configuration = aws_launch_configuration.asg-launch-config.id
  vpc_zone_identifier  = [aws_subnet.public_subnet[0].id, aws_subnet.public_subnet[1].id]

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = 2

  load_balancers    = [aws_elb.Nejat-elb.name]
  health_check_type = "EC2"

  tag {
    key                 = "Name"
    value               = "Nejat-asg"
    propagate_at_launch = true
  }

}

output "asg_name" {
  value       = aws_autoscaling_group.Nejat-asg.name
  description = "The name of the Auto Scaling Group"
}