resource "aws_autoscaling_group" "MyAutoScaling" {
  name               = "My-AutoScaling"
  max_size           = 0
  min_size           = 0
  desired_capacity   = 0
  force_delete       = true
  availability_zones = ["us-east-1a"]
  

  launch_template {
    id      = aws_launch_template.My-Launch.id
    version = aws_launch_template.My-Launch.latest_version
  }
  tag {
    key                 = "Name"
    value               = "EC2-instances-tf"
    propagate_at_launch = true
  }

}
