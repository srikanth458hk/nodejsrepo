pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        git branch: 'main', url: 'https://github.com/srikanth458hk/nodejsrepo.git'
        sh 'docker login -u AWS -p $(aws ecr get-login-password --region ap-south-1) 125523629880.dkr.ecr.ap-south-1.amazonaws.com'
        sh 'docker build -t nodejs .'
        sh 'docker tag nodejs:latest public.ecr.aws/y6s3n1h9/nodejs:latest'
        sh 'docker push public.ecr.aws/y6s3n1h9/nodejs:latest'
      }
    }
  }
}
  



