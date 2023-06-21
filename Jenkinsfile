pipeline {
  agent any
  stages {
    stage('Clone repository') {
      steps {
        git 'https://github.com/mahmoud254/jenkins_nodejs_example.git'
      }
    }
    stage('Build Docker image') {
      steps {
        sh 'docker build -t my-nodejs-app .'
      }
    }
    stage('Push Docker image to Nexus') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'nexus-creds', usernameVariable: 'NEXUS_USERNAME', passwordVariable: 'NEXUS_PASSWORD')]) {
          nexusArtifactUploader(
            nexusUrl: 'http://nexus.example.com/repository/docker/',
            protocol: 'docker',
            credentialsId: 'nexus-creds',
            groupId: 'com.example',
            version: '1.0.${BUILD_NUMBER}',
            repository: 'my-nodejs-app',
            tag: 'latest',
            dockerfilePath: '.',
            dockerImageName: 'my-nodejs-app'
          )
        }
      }
    }
  }
}
