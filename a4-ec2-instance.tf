# Create EC2 Instance - Amazon Linux
resource "aws_instance" "my-ec2-vm" {
  ami           = "ami-04db49c0fb2215364"
  instance_type = var.instance_type
  key_name      = "demo-ec2"
  #count = terraform.workspace == "default" ? 1 : 1    
#user_data = file("apache-install.sh")  
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  tags = {
    "Name" = "vm-${terraform.workspace}-0"
  }

  provisioner "remote-exec" {
    inline = [
      "sleep 60"
    ]
  }

  connection {
    type = "ssh"
    host = self.public_ip # Understand what is "self"
    user = "ec2-user"
    password = ""
    private_key = file("private-key/terraform-key.pem")
  } 
  
  # local-exec provisioner (Creation-Time Provisioner - Triggered during Create Resource)
  provisioner "local-exec" {
    command = "echo ${aws_instance.my-ec2-vm.public_ip} >> inv"
    working_dir = "inventory/"
    #on_failure = continue
  }

  provisioner "local-exec" {
    command = "ansible-playbook --private-key=private-key/terraform-key.pem -i inventory/inv jenkins_roles_ansible/jenkins_ansible.yml -u ec2-user" 
     #on_failure = continue
  }

  # local-exec provisioner - (Destroy-Time Provisioner - Triggered during Destroy Resource)
  provisioner "local-exec" {
    when    = destroy
    command = "echo Destroy-time provisioner Instanace Destroyed at `date` >> destroy-time.txt"
    working_dir = "inventory/"
  }


}








