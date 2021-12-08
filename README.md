
# Automate deployment of passwordless Jenkins server using Terraform & Ansible.

1. Clone the repository:

```
git clone https://github.com/KunalNK/jenkins-terraform-ansible.git

```

2. Now inside the directory "private-key" replace the contents of terraform-key.pem file with your .pem file contents & change the permission of the file using the following command.

```
chmod 400 terraform-key.pem

```

3. Next, run the following terraform commands to create resources & deploy the application on AWS ec2 instance:

```
terraform init
terraform apply --auto-approve

```
4. To access the jenkins server, the copy the ec2-public-ip or ec2-publicdns of your ec2-instance & paste it in the browser with port number 8080. For example

```
62.55.96.11:8080

```
5. Finally, run the following terraform command to clean-up the created resources.

```
terraform destroy --auto-approve

```

