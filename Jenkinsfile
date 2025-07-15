pipeline {
  agent any

  environment {
    DOCKER_IMAGE = 'riaanlee/my-portfolio-app:latest'
  }

  stages {

    stage('Checkout Code') {
      steps {
        git credentialsId: 'Github', url: 'https://github.com/riaanlee/portfolio-site.git'
      }
    }

    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          sh "docker build -t $DOCKER_IMAGE ."
        }
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
          sh """
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            docker push $DOCKER_IMAGE
          """
        }
      }
    }

  }

  post {
    success {
      echo '✅ Build and push successful!'
    }
    failure {
      echo '❌ Pipeline failed.'
    }
  }
}
