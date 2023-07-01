#ITI_Graduation_Project

## Install Minikube using ansible

## Terraform Demo


### Start minikube 



### Enable ingress
- Kubernetes Ingress addons are additional components or features that can be installed in a Kubernetes cluster to enhance the functionality of the Ingress resource. Ingress is an API object in Kubernetes that manages external access to services within a cluster.

- Ingress addons provide advanced routing and traffic management capabilities for Kubernetes clusters. They enable features such as load balancing, SSL termination, path-based routing, and more. One popular Ingress addons is:

- Nginx Ingress Controller: This addon uses the Nginx web server as a reverse proxy to handle incoming traffic and route it to the appropriate services based on the defined rules. It supports various load balancing algorithms, SSL/TLS termination, and other advanced features.


### Terraform init


### Terraform apply


### Terraform state list




### Configure minikube /etc/hosts file
- Map custom hostnames to the IP addresses of services running in Minikube. This allows us to access services using user-friendly names in your local environment.










## Jenkins Demo 


### Open Jenkins 
- use http://jenkins.local.com/ in the browser to open jenkins.





### Get Jenkins Admin Password 
- kubectl get pods -n tools
- kubectl exec -n tools -it jenkins-745954bdbf-shsn9 -- cat /var/jenkins_home/secrets/initialAdminPassword



### Customize Jenkins
- Plugins extend Jenkins with additional features to support many different needs.




### Create First admin user



### Open Nexus
write http://nexus.local.com/ in the browser to open nexus




### Get Nexus Admin Password:
- kubectl get pods -n tools
- kubectl exec -it nexus-6b5bd9f4ff-l7tmp -n tools -- cat /nexus-data/admin.password

### Create Nexus user 



### Create Nexus Repo




### Create Jenkins Credintials for Nexus:

