pipeline {
    agent {
        docker {
            image 'node:18' // or 'node:20' if you're using 20.x
        }}
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run App') {
            steps {
                sh 'node app.js'
            }
        }
    }
}
