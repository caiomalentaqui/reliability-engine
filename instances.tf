resource "aws_launch_template" "app_server" {
  name          = var.template_name
  image_id      = var.image_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  # O script que instala o Nginx
  user_data = base64encode(var.user_data)

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "asg-app-server"
    }
  }
}

resource "aws_autoscaling_group" "app_asg" {

  name                = "${var.project_name}-asg"
  vpc_zone_identifier = [aws_subnet.public_1.id, aws_subnet.public_2.id]
  desired_capacity    = 2
  max_size            = 4
  min_size            = 2

  health_check_grace_period = 120
  health_check_type         = "ELB"

  target_group_arns = [aws_lb_target_group.main.arn]

  launch_template {
    id      = aws_launch_template.app_server.id
    version = "$Latest"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_policy" "cpu_scaling" {
  name                   = "cpu-target-tracking"
  autoscaling_group_name = aws_autoscaling_group.app_asg.name # Conecta ao seu ASG
  policy_type            = "TargetTrackingScaling"

  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }

    target_value = 50.0
  }
}
