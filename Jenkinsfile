pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        git branch: 'main', url: 'https://github.com/srikanth458hk/nodejsrepo.git'
        sh 'docker build -t nodejs .'
      }
    }

    stage('Push') {
      steps {
        withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'nodejs']]) {
          script {
            def ecrRepo = '125523629880.dkr.ecr.ap-south-1.amazonaws.com/nodejs'
            def dockerTag = "${ecrRepo}:latest"

            // Authenticate to ECR
             sh "aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/y6s3n1h9"

            // Tag Docker image with ECR repository
            sh "docker tag nodejs:latest ${dockerTag}"

            // Push Docker image to ECR
            sh "docker push ${dockerTag}"
          }
        }
      }
    }
  }
}
