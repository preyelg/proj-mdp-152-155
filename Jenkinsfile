pipeline {
  agent any
  environment {
    DOCKER_HUB_CREDENTIALS = 'Docker-hub'
    IMAGE_NAME = 'preyelg/proj-3:latest'
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: 'project-3', url: 'https://github.com/preyelg/proj-mdp-152-155.git'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build("${IMAGE_NAME}")
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        script {
          docker.withRegistry('', "${DOCKER_HUB_CREDENTIALS}") {
            docker.image("${IMAGE_NAME}").push()
          }
        }
      }
    }

    stage('Deploy to K8s') {
      steps {
        sh 'kubectl apply -f k8s/deployment.yaml'
        sh 'kubectl apply -f k8s/service.yaml'
      }
    }
  }
}
