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
    
    
   stage('Deploy to ECS') {
      
      steps {
        script {
          def registerOutput = sh (
            script: 'aws ecs register-task-definition --cli-input-json file=ecs-task-definition.json',
            returnStdout: true
          ).trim()

          echo "Registered Task Definition: ${registerOutput}"
          
          // Extract the task definition ARN
          def taskDefinitionArn = registerOutput =~ /\"taskDefinitionArn\": \"(.+?)\"/
          if (taskDefinitionArn) {
            def arn = taskDefinitionArn[0][1]
            
            // Update the ECS service with the new task definition
            sh "aws ecs update-service --cluster demo-cluster --service servicenodejs --task-definition ${arn}"
          } else {
            error "Failed to extract Task Definition ARN from the command output."
          }
        }
    
      }
   }
  }
}
