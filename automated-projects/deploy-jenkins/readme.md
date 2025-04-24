# Jenkins deployments on AWS 🌸
## With Terraform and Ansible, using Nginx server 🌸

Welcome to the Jenkins Deployment Project! This repository is dedicated to demonstrating how to deploy Jenkins on AWS using Terraform and Ansible, with Nginx serving as a reverse proxy. It’s an efficient, and streamlined approach to setting up a robust CI/CD environment.

## Project Overview 🌼

This project leverages the power of Terraform for infrastructure provisioning and Ansible for configuration management to deploy a fully functional Jenkins server. Nginx is configured to enhance security and manage traffic, ensuring that Jenkins runs smoothly and securely.

## Why Jenkins? 🌷

Jenkins is a powerhouse in the world of continuous integration and continuous delivery (CI/CD). It offers:

- **Extensibility**: Jenkins is highly customizable with a vast ecosystem of plugins.
- **Versatility**: It supports all types of software development platforms and languages.
- **Community Support**: Being an open-source tool, it has a strong community providing robust support and continuous updates.

## Deployment Architecture 🌹

This project includes a detailed deployment architecture that illustrates how Jenkins interacts with AWS services, Ansible, and Nginx. Below is the architecture diagram:

![Jenkins Deployment Architecture](https://res.cloudinary.com/dhugrtkns/image/upload/v1715896366/alrdb4ptel6zunp7twtd.png)

## How It Works 🌻

- **Terraform**: Provisions the AWS infrastructure, including EC2 instances, security groups, and networking components.
- **Ansible**: Automates the configuration of the EC2 instances, installs Jenkins, and sets up Nginx as a reverse proxy.
- **Nginx**: Acts as a front door for Jenkins, handling HTTPS requests and providing an additional layer of security.

## Documentation, threads & tool used 📰

- **OVH** : 
    - [First Steps with the OVHcloud APIs](https://help.ovhcloud.com/csm/en-api-getting-started-ovhcloud-api?id=kb_article_view&sysparm_article=KB0042777)
    - [OVHcloud API specification](https://eu.api.ovh.com/console-preview/?section=%2FallDom&branch=v1) (useful if you need to revoke a token for example)
- **Jenkins** : 
    - [Set up Jenkins with Ansible (2018)](https://knowledgevault-sharing.blogspot.com/2018/03/set-up-jenkins-with-ansible.html)
    - [Jenkins Debian Packages (most recent)](https://pkg.jenkins.io/debian/)
    - [How-To-Install-Jenkins-on-Debian-12](https://gist.github.com/darinpope/b7c52280a31debbf3d19f5a9a75bdfe9)
- **Ansible** :
    - [Jenkins on AWS](https://www.jenkins.io/doc/tutorials/tutorial-for-installing-jenkins-on-AWS/)
    - [Ansible Builtin module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/index.html)
    - [How to install Jenkins using ansible (2017)](https://awsbloglink.wordpress.com/2017/11/02/how-to-install-jenkins-using-ansible/)
    - [Ansible Playbook — Java, Jenkins and Ansible Installation on Linux Machines](https://medium.com/vertisystem-platform-services/ansible-playbook-java-jenkins-and-ansible-installation-on-linux-machines-b0215032e9ae)
    - [Why we need to put fully ansible.builtin.xxx in ansible playbook?](https://learn.redhat.com/t5/Automation-Management-Ansible/Why-we-need-to-put-fully-ansible-builtin-xxx-in-ansible-playbook/td-p/27381)
- **Terraform** :
    - [Environment variables](https://developer.hashicorp.com/terraform/cli/config/environment-variables)
    - [Environnement variable 2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#environment-variables)
    - [Pathexpand function](https://developer.hashicorp.com/terraform/language/functions/pathexpand)
    - [How to Create AWS EC2 Instance Using Terraform](https://spacelift.io/blog/terraform-ec2-instance)
    - [How to Use Environment Variables on Terraform (2021)](https://medium.com/codex/how-to-use-environment-variables-on-terraform-f2ab6f95f82d)
    - [How to use output value in same root module for creating another resource](https://discuss.hashicorp.com/t/how-to-use-output-value-in-same-root-module-for-creating-another-resource/43162)
    - [How to access a local using a variable in Terraform](https://stackoverflow.com/questions/72236321/how-to-access-a-local-using-a-variable-in-terraform)
- **AWS** :
    - [Debian Wiki](https://wiki.debian.org/Cloud/AmazonEC2Image)
    - [Learn Cantrill](https://learn.cantrill.io/)
- [La Capsule courses](https://www.lacapsule.academy/)

## Getting Started 🎀

To get this Jenkins environment up and running on your own AWS account, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/jenkins-deployments.git
   cd jenkins-deployments

