# ITI_Graduation_Project
This repository contains the code and configuration for my graduation project from the ITI (Information Technology Institute). The project focuses on setting up a Kubernetes-based deployment pipeline using Jenkins, Minikube, Terraform, Docker, and Kubernetes.

## Project Overview

The goal of this project is to automate the deployment of a Node.js application and MySQL database on a local Kubernetes cluster. The deployment pipeline is orchestrated using Jenkins, with the infrastructure provisioned using Terraform. Here's an overview of the project's main components and tasks:

1. **Setting up the Kubernetes Cluster:**
   - Utilized Ansible to install and configure Minikube, providing a local Kubernetes instance.
   - Configured two namespaces: "tools" and "dev" using Terraform, each serving a specific purpose in the pipeline.

2. **Namespace and Pod Configuration:**
   - Installed Jenkins and Nexus pods in the "tools" namespace using Terraform. Jenkins serves as the automation engine, while Nexus acts as the container registry.
   - Configured the "dev" namespace to run two pods: one for the Node.js application and another for the MySQL database.

3. **Jenkins Pipeline Job:**
   - Created a Jenkins pipeline job responsible for automating the deployment process.
   - The pipeline performs the following steps:
     - Checks out the source code from the provided GitHub repository: [https://github.com/mahmoud254/jenkins_nodejs_example.git](https://github.com/mahmoud254/jenkins_nodejs_example.git).
     - Builds the Node.js application using the provided Dockerfile.
     - Creates a Docker image for the application.
     - Uploads the Docker image to the Nexus repository for storage.

4. **Docker Container Deployment:**
   - Developed another Jenkins pipeline job to deploy the Docker container on the desired environment.
   - The pipeline retrieves the Docker image from Nexus and deploys it to the specified environment on Minikube.

5. **Configuration Management with Secrets:**
   - Implemented secure handling of microservice configurations using Kubernetes secrets.
   - Stored sensitive configuration information in secrets and updated the microservice pods to access the configurations securely.

## Installing and Configuring Minikube with Ansible

The first step of the project includes an Ansible playbook to automate the installation and configuration of Minikube, allowing you to set up a local Kubernetes cluster effortlessly. The playbook performs the following steps:

1. **Update Apt Cache:**
   - The playbook updates the apt cache on the target system using the `apt` module. This ensures that the system has the latest package information.

2. **Install Dependencies:**
   - Necessary dependencies, such as `apt-transport-https`, `ca-certificates`, `curl`, and `software-properties-common`, are installed using the `apt` module. These packages are required for subsequent steps.

3. **Add Docker GPG Key:**
   - The playbook uses the `apt_key` module to add the GPG key for the Docker repository. This key is necessary to authenticate and verify the packages during installation.

4. **Add Docker Repository:**
   - The `apt_repository` module is used to add the Docker repository to the system's package sources. This step ensures that Docker can be installed from the official Docker repository.

5. **Install Docker:**
   - The playbook installs Docker using the `apt` module. The package `docker-ce` is installed to set up the Docker engine on the target system.

6. **Install Minikube Dependencies:**
   - Required dependencies for Minikube, such as `conntrack`, `ebtables`, and `socat`, are installed using the `apt` module. These dependencies are necessary for Minikube to function properly.

7. **Download Minikube:**
   - The playbook uses the `get_url` module to download the latest Minikube binary for Linux from the official Google Cloud Storage. The downloaded binary is saved as `/usr/local/bin/minikube` and given executable permissions (`0755`).

8. **Start Minikube Cluster:**
   - The playbook starts the Minikube cluster using the `command` module. The command `minikube start --driver=docker --force` starts Minikube with the Docker driver, ensuring a consistent and reliable Kubernetes environment.

9. **Set KUBECONFIG Environment Variable:**
   - The playbook uses the `lineinfile` module to add the `KUBECONFIG` environment variable to the user's `.bashrc` file. This environment variable points to the Kubernetes configuration file (`$HOME/.kube/config`), allowing easy interaction with the Minikube cluster.

Please ensure that the target system meets the necessary requirements and has Ansible installed before executing the playbook.

To run the playbook, use the following command:

```shell
ansible-playbook playbook.yml
```

Add `-i inventory` with your inventory file and `playbook.yml` with the path to the Ansible playbook file in case you would run it against a remote server other than the localhost.
## Terraform Demo


### Start minikube 
- minikube start
![Screenshot from 2023-07-01 21-34-20](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/85a50c66-ec63-49fe-9ff4-030cecc2d226)

### Enable ingress
- Kubernetes Ingress addons are additional components or features that can be installed in a Kubernetes cluster to enhance the functionality of the Ingress resource. Ingress is an API object in Kubernetes that manages external access to services within a cluster.


- Ingress addons provide advanced routing and traffic management capabilities for Kubernetes clusters. They enable features such as load balancing, SSL termination, path-based routing, and more. One popular Ingress addons are:

- Nginx Ingress Controller: This addon uses the Nginx web server as a reverse proxy to handle incoming traffic and route it to the appropriate services based on the defined rules. It supports various load-balancing algorithms, SSL/TLS termination, and other advanced features.

- minikube addons enable ingress

![Screenshot from 2023-07-01 21-34-35](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/74ee1f12-4fee-475a-b772-e93b9c4a4d6a)

### Terraform init
![Screenshot from 2023-07-01 22-19-27](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/4070cbcd-4f65-4164-971e-07aaf21760c1)


### Terraform apply
![Screenshot from 2023-07-01 22-22-43](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/9570634a-b8e0-4beb-a4d2-6d638157ae39)

![Screenshot from 2023-07-01 22-24-37](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/b31f2c4d-b13b-430c-a356-f1112e1d3f01)

### Terraform state list
![Screenshot from 2023-07-01 22-25-30](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/c4b5ca11-4cfd-4281-b4c4-626483cac07d)

### Configure minikube /etc/hosts file
- Map custom hostnames to the IP addresses of services running in Minikube. This allows us to access services using user-friendly names in your local environment.

![Screenshot from 2023-07-01 22-50-25](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/f7bb9cfb-6b81-4a06-8f46-d6fc4bfbdc0d)

![Screenshot from 2023-07-01 22-49-35](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/0c029703-f3ea-421f-abba-66c8f65bea59)




## Jenkins Demo 


### Open Jenkins 
- use http://jenkins.local.com/ in the browser to open jenkins.

![Screenshot from 2023-07-01 22-54-03](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/08ff8c3b-d8b4-4705-af81-2b1a2cf195f1)



### Get Jenkins Admin Password 
- kubectl get pods -n tools
- kubectl exec -n tools -it jenkins-745954bdbf-shsn9 -- cat /var/jenkins_home/secrets/initialAdminPassword

![Screenshot from 2023-07-01 23-16-42](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/d2f88c1b-b399-4ae3-8ed6-d4986e9603cc)

![Screenshot from 2023-07-01 23-17-08](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/d313e039-defe-42dc-89f6-365e3329758a)

### Customize Jenkins
- Plugins extend Jenkins with additional features to support many different needs.
![Screenshot from 2023-07-01 23-17-27](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/7c5591ad-88e1-44e0-a1b7-7014d64bf379)

![Screenshot from 2023-07-01 23-29-24](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/5e9a0193-3261-40e6-8223-6b908ebf9f54)


### Create the First admin user
![Screenshot from 2023-07-01 23-30-38](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/8122370a-0a51-4173-9fbe-089f616cfbed)
![Screenshot from 2023-07-01 23-40-11](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/799fa1be-207f-4812-b206-e94505e6a2c0)


### Open Nexus
Write http://nexus.local.com/ in the browser to open nexus
![Screenshot from 2023-07-01 23-01-05](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/5883d678-fcf2-4249-84b8-4007f91e7063)
![Screenshot from 2023-07-01 23-01-11](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/0284b0fb-8628-4f2f-9acb-7b3514046c2c)




### Get Nexus Admin Password:
- kubectl get pods -n tools
- kubectl exec -it nexus-6b5bd9f4ff-l7tmp -n tools -- cat /nexus-data/admin.password

![Screenshot from 2023-07-01 23-48-58](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/ee4b062f-13ed-43e4-8a73-e742cbbc1d8b)
![Screenshot from 2023-07-01 23-49-21](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/05c1097e-001c-46af-8dad-40f677eaa09c)




### Create a Nexus user 
![Screenshot from 2023-07-01 23-55-32](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/940dca02-628b-4fab-b703-67d8c8c748e6)
![Screenshot from 2023-07-02 01-21-37](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/fb55edf7-8dd4-46cf-9a8c-c79d67918fba)



### Create Nexus Repo
![Screenshot from 2023-07-02 01-22-02](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/64da8290-c64d-4502-a9d4-af292fd9eafa)
![Screenshot from 2023-07-02 01-22-37](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/0ba716af-97e0-4620-9d14-2fd78405da7f)
![Screenshot from 2023-07-02 01-24-25](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/dfda3c60-c09b-4cb8-b168-d3ac3b187041)
![Screenshot from 2023-07-02 01-25-03](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/147dec32-369f-4c91-b089-f2c0c6303c13)



### Create Jenkins Credentials for Nexus:
![Screenshot from 2023-07-02 01-27-45](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/df26675a-9ec2-44ef-bdc7-73589ce7eeef)

![Screenshot from 2023-07-02 01-27-52](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/40e785a6-9da8-4a40-be4e-03f0cf3e61a3)

![Screenshot from 2023-07-02 01-27-57](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/3c400c4d-64f1-41ea-8271-087f5accfb14)

![Screenshot from 2023-07-02 01-29-43](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/cac7fd09-59ba-4cd9-b8b5-66cc09bb8bb3)

![Screenshot from 2023-07-02 01-29-55](https://github.com/NadaMarei/ITI-Graduation-Project/assets/118731723/e4e7c5f1-6c87-4882-8dd9-806a42ed534c)


### Run Jenkins CI 
![Screenshot from 2023-07-04 08-04-47](https://github.com/Mohamed-Sharif/ITI-Final-Project/assets/118731723/368dcafe-5003-4b01-80eb-3ae1583e01ff)

![Screenshot from 2023-07-03 19-20-57](https://github.com/Mohamed-Sharif/ITI-Final-Project/assets/118731723/e95deb80-19ae-41fd-b6dc-b6a9154a5d72)

### Image pushed to nexus
![Screenshot from 2023-07-03 04-31-04](https://github.com/Mohamed-Sharif/ITI-Final-Project/assets/118731723/aff37445-a026-4a43-bae0-29be1e27a686)


### Connect to the database
`kubectl exec -it mysql-7cccd7f54d-pd6qn -n dev -- mysql -u root -p`

### Create sql user with privileges
```
CREATE USER 'sqluser'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'sqluser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
```

### Connecting to mysql
![Screenshot from 2023-07-03 11-15-43](https://github.com/Mohamed-Sharif/ITI-Final-Project/assets/118731723/dbd3709b-f0ab-4292-b1e3-2fef27433e51)


### Run Jenkins CD 
![Screenshot from 2023-07-04 08-06-44](https://github.com/Mohamed-Sharif/ITI-Final-Project/assets/118731723/61f4bca7-44a0-4638-aa1f-a43885c75009)
![Screenshot from 2023-07-04 00-32-26](https://github.com/Mohamed-Sharif/ITI-Final-Project/assets/118731723/bf475d8e-ab50-4407-9f1b-647064925f70)

### App running successfully
![Screenshot from 2023-07-03 14-35-13](https://github.com/Mohamed-Sharif/ITI-Final-Project/assets/118731723/d62d3ab1-29a2-4d31-9081-177983764689)


### Project Done successfully
![Screenshot from 2023-07-03 14-36-07](https://github.com/Mohamed-Sharif/ITI-Final-Project/assets/118731723/e087b9d9-b151-440d-8ada-5e03bbaeca87)

## Authors 
This repository was built with ❤️ by:<br>
<a href="https://github.com/NadaMarei">- Nada Marei</a>  <a href="https://github.com/mahmoudmohamed22">- Mahmoud Abdelwahab</a> <a href="https://github.com/Mohamed-Sharif/ITI-Final-Project">- Mohamed Sharif</a>









