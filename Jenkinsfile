pipeline {
  agent any

  environment {
    DOCKER_IMAGE = "your-dockerhub-username/riaan-portfolio"
  }

  stages {
    stage('Build') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE .'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh 'echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin'
          sh 'docker push $DOCKER_IMAGE'
        }
      }
    }

    stage('Deploy via Helm') {
      steps {
        sh 'helm upgrade --install portfolio-site ./portfolio-chart'
      }
    }
  }
}
