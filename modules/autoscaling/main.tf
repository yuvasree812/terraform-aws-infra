resource "aws_launch_template" "lt" {
  name_prefix   = "app-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  network_interfaces {
    security_groups = [var.ec2_sg_id]
  }
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity    = var.desired
  max_size           = var.max
  min_size           = var.min
  vpc_zone_identifier = var.private_subnets

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
}