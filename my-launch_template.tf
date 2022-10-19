resource "aws_launch_template" "My-Launch" {
  name                   = "MyLaunchTemplate"
  key_name               = var.key_name
  instance_type          = "t2.micro"
  image_id               = "ami-026b57f3c383c2eec"
  vpc_security_group_ids = ["sg-026b57f3c383c2eec"]


  user_data = filebase64("myuserdata.sh")

  iam_instance_profile {
    name = "AWSEC2roleAdmin"
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "EC2-terraform"

    }
  }
 
}


