pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        git branch: 'main', url: 'https://github.com/srikanth458hk/nodejsrepo.git'
        sh 'docker build -t nodejs .'
      }
    }
    stage('loginintoECR') {
      steps {
        
        sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/y6s3n1h9'

      }
    }
    stage('PushintoECR') {
      steps {
        sh 'docker tag nodejs:latest public.ecr.aws/y6s3n1h9/nodejs:latest'
        sh 'docker push public.ecr.aws/y6s3n1h9/nodejs:latest'

      }
    }

    
    
  }
}
