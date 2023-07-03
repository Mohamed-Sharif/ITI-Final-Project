pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository
                git url: 'https://github.com/mahmoud254/jenkins_nodejs_example.git', branch: 'k8s_task'
            }
        }
        
        stage('Build Image') {
            steps {
                // Build the image as per your requirements
                sh 'docker build -t nodejs-app:latest .'
            }
        }
        
        stage('Push to Nexus') {
            steps {
                // Login to the Nexus registry
                withCredentials([usernamePassword(credentialsId: 'nexus', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "docker login -u $USERNAME -p $PASSWORD 10.107.157.34:5000"
                }
                
                // Tag the image with Nexus registry information
                sh 'docker tag nodejs-app:latest 10.107.157.34:5000/repository/nexus-repo/nodejs-app:latest'
                
                // Push the image to Nexus registry
                sh 'docker push 10.107.157.34:5000/repository/nexus-repo/nodejs-app:latest'
            }
        }
    
        stage('Deploy Image') {
            steps {
                git url: 'https://github.com/Mohamed-Sharif/ITI-Final-Project.git', branch: 'main'
                // Deploy the app from the Nexus registry to Cluster
                sh """
                cd Terraform
                kubectl apply -f nodejs_app.yaml 

                kubectl apply -f mysql.yaml 
                """
            }
        }
    }
}
            
