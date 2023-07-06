pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        git branch: 'main', url: 'https://github.com/srikanth458hk/nodejsrepo.git'
        
      }
    }
     stage('Build and Push Docker Image') {
            steps {
                script {
                    def dockerTag = "nodejs:${env.BUILD_NUMBER}"
                    def ecrRepo = "nodejs"
                    
              
                    sh "docker build -t ${dockerTag} ."
                    
                 
                    withCredentials([[
                        $class: 'AmazonWebServicesCredentialsBinding',
                        accessKeyVariable: 'AKIAR2OOKS44LIAQLO75',
                        secretKeyVariable: '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',
                        credentialsId: 'nodejs'
                    ]]) {
                        sh "docker login -u AWS -p $(AKIAR2OOKS44LIAQLO75) -e none https://$(125523629880).dkr.ecr.$(ap-south-1).amazonaws.com"
                    }
                    
                    
                    sh "docker tag ${dockerTag} ${125523629880}.dkr.ecr.${ap-south-1}.amazonaws.com/${nodejs}:${dockerTag}"
                    
                    
                    sh "docker push ${125523629880}.dkr.ecr.${ap-south-1}.amazonaws.com/${nodejs}:${dockerTag}"
                }
            }
        }
    }
}

  

  



