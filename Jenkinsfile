pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        chmod +x build.sh
        sh './build.sh'
      }
    }
    stage('Push') {
      steps {
        
        chmod +x push.sh
        sh './push.sh'

      }
    }
    
    
   
  }
}
