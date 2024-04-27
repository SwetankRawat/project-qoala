resource "aws_instance" "my_ec2_instance" {
  ami           = "desired-ami-id"  # Change to your desired AMI
  instance_type = "t2.mirco"  # Change to your desired instance type
  subnet_id     = aws_subnet.private_subnet_1.id  # Specify the ID of the private subnet you want to use
}