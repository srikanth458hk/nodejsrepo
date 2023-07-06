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
          withCredentials([credentialsId: 'nodejs']) {
            def ecrRepo = '125523629880.dkr.ecr.ap-south-1.amazonaws.com/nodejs'
            def dockerTag = "${ecrRepo}:latest"

            sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin ${ecrRepo}"

    
            sh "docker tag node-app:latest ${dockerTag}"

          
            sh "docker push ${dockerTag}"
          }
        }
      }
    }
  }
}
  



