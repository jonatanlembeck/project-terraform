resource "aws_security_group" "instance" {
  name = "my-sg-vpc"
  vpc_id = aws_vpc.My-VPC-TF.id

  ingress {
    description = "Permite HTTP"
    from_port = 8080
    to_port = 8080
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    description = "SSH to EC2"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    description = "meu IP"
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["177.200.196.98/32"]

  }
  egress {
    description = "Saida FULL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}