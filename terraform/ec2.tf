
# Define the EC2 instance
resource "aws_instance" "example_instance" {
  ami           ="ami-0182f373e66f89c85"
  instance_type = "t2.micro"               
  # Specify the security group to associate with the instance
  vpc_security_group_ids = [aws_security_group.my_security_group.id]
  subnet_id     = aws_subnet.my_subnet.id
  key_name = aws_key_pair.my_key_pair.key_name
  associate_public_ip_address = true


}