#### TEST    tf-user

resource "aws_instance" "test-server" {
  availability_zone = "ap-northeast-2c"
  ami = "ami-0fd0765afb77bcca7"
  instance_type = "t2.micro"
#  associate_public_ip_address = false
  key_name = "key-test"
  tags = {
    Name = "test-server"
  }
}
