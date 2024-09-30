# Jenkins-pipeline-for-static-web-app
this project is a pipeline to build and deploy a static web application on AWS applying a set of DevOps tools 

## requirements:
* Git
* Terraform
* Ansible
* AWS account
* SSH


## Tools:
* git
* Docker
* Terraform
* Ansible 
* Jenkins CICD
* AWS

## To Run This Pipeline:

### clone this repo :
```bash
git clone https://github.com/rashadahmed424/Jenkins-pipeline-for-static-web-app/
```

### create 'provider'.tf file to configure AWS account and Credentials:
```bash
echo " provider "aws" {
          region = "YOUR REGION" 
          access_key = "YOUR ACCESS KEY"
          secret_key = "YOUR SECRET KEY"
                      }  " >> Jenkins-pipeline-for-static-web-app/provider.tf
```

### Move to terraform directory and initialize terraform then apply files and confirm it:
```bash
cd Jenkins-pipeline-for-static-web-app/terraform/
terraform init
terraform apply
```

### Access jenkins through Public IP of created EC2 instance with port '8080' then configure credentials and sshagent in jenkins.

### create another EC2 instance to be the deployment server and attach your public SSH key to it.

### Move to 'ansible' directory and edite IPs in inventory file with your EC2s instances.

### Run Anisble playbook:
```bash
ansible-playbook -i inventory playbook.yaml 
```

###  edite 'DeployServer' variable in Jenkinsfile with IP of your deployment server.
  ![image](https://github.com/user-attachments/assets/f191b403-7b6b-414a-a8c9-5d7dbbc13519)

### Run the pipeline on jenkins server through:
  ![image](https://github.com/user-attachments/assets/b0456914-7a22-4906-beeb-c0623024783a)

### Access the web application through deployment server ip with port '8080':
  ![Screenshot from 2024-09-27 10-12-20](https://github.com/user-attachments/assets/fe0bac47-369c-4373-960f-8bf858989369)





