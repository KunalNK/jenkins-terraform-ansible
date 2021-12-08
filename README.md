
# Automate deployment of passwordless Jenkins server using Terraform & Ansible.

1. Clone the repository:

```
git clone https://github.com/KunalNK/jenkins-terraform-ansible.git

```

2. Now inside the directory "private-key" replace the contents of terraform-key.pem file with your .pem file contents.


3. Next, run the following terraform commands to create resources & deploy the application on AWS ec2 instance:

```
terraform init
terraform apply --auto-approve

```
4. Finally, run the following terraform command to clean-up the created resources.

```
terraform destroy --auto-approve

```

