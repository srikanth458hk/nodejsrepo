pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        git branch: 'main', url: 'https://github.com/srikanth458hk/nodejsrepo.git'
        sh 'docker image build -t nodejs/images:nodeja-ver0.1 .'
      }
    }

    stage('Push') {
      steps {
        sh 'docker image push nodejs/images:hackathon-starter-ver0.1'
        
      }
    }
  }
}
  



