pipeline {
    agent any
    tools {
        nodejs 'node20' // Make sure this is defined in Global Tool Configuration
    }
    stages {
        stage('Print Node Version') {
            steps {
                sh 'node -v'
                sh 'npm -v'
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run App') {
            steps {
                sh 'npm start'
            }
        }
    }
}
