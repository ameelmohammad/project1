####### deploy EC2 machine for webserver 
resource "aws_instance" "web" {
  ami           = var.imageid
  instance_type = var.instantancetype
  key_name = var.keyname
  subnet_id = aws_subnet.subnet-1.id 
  associate_public_ip_address = true 
  vpc_security_group_ids = ["${aws_security_group.allow_tls.id}"]
  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("terraform.pem")
    host     = aws_instance.web.public_dns
  }
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install nginx -y",
      "sudo apt-get install zip -y",
      "sudo apt-get install unzip -y",
      "wget https://www.free-css.com/assets/files/free-css-templates/download/page296/mediplus-lite.zip",
      "sudo unzip mediplus-lite.zip",
      "sudo mv mediplus-lite /var/www/html/"
    ]
  }
  

  tags = {
    Name = "Webserver"
  }
}
