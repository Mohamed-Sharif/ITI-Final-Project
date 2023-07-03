# ITI_Graduation_Project

## Install Minikube using ansible

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

### Insatll docker and kubectl on jenkins pod
```
apt update
apt install docker.io
apt install -y apt-transport-https gnupg2 curl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
mv kubectl /usr/local/bin/kubectl
chmod +x /usr/local/bin/kubectl
kubectl version --short

```



### Connect to the database
kubectl exec -it mysql-7cccd7f54d-pd6qn -n dev -- mysql -u root -p



















