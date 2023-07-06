pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        git branch: 'main', url: 'https://github.com/srikanth458hk/nodejsrepo.git'
        sh 'docker build -t node-app .'
      }
    }

    stage('Push') {
      steps {
        script {
          withCredentials([credentials: 'nodejs']) {
            def ecrRepo = '125523629880.dkr.ecr.ap-south-1.amazonaws.com/nodejs'
            def dockerTag = "${ecrRepo}:latest"

            // Login to ECR
            sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin ${ecrRepo}"

            // Tag Docker image
            sh "docker tag node-app:latest ${dockerTag}"

            // Push Docker image to ECR
            sh "docker push ${dockerTag}"
          }
        }
      }
    }
  }
}


