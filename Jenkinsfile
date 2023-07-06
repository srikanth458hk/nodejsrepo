pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        // Checkout the source code from your repository
        checkout scm

        // Build the Docker image
        sh 'docker build -t node-app .'
      }
    }

    stage('Deploy to ECS') {
      environment {
        AWS_DEFAULT_REGION = 'your_aws_region'
        AWS_ACCOUNT_ID = 'your_aws_account_id'
        AWS_ECR_REPO = 'your_ecr_repository_name'
        ECS_CLUSTER = 'your_ecs_cluster_name'
        ECS_SERVICE = 'your_ecs_service_name'
      }
      
      steps {
        // Login to AWS ECR
        script {
          def ecrLogin = sh(
            returnStdout: true,
            script: 'aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com'
          )
          echo ecrLogin
        }

        // Push the Docker image to AWS ECR
        sh "docker tag node-app:latest $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$AWS_ECR_REPO:latest"
        sh "docker push $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com/$AWS_ECR_REPO:latest"

        // Update the ECS service
        sh "aws ecs update-service --cluster $ECS_CLUSTER --service $ECS_SERVICE --force-new-deployment"
      }
    }
  }
}
