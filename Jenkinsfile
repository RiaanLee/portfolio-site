pipeline {
    agent any

    tools {
        jdk 'jdk17'
        nodejs 'node16'
    }

    environment {
        SCANNER_HOME = tool 'sonar-scanner'
        DOCKER_IMAGE = 'riaanlee/portfolio-site'
    }

    stages {
        stage('Clean workspace') {
    steps {
        deleteDir() // Jenkins pipeline method
    }
}


        stage('Checkout from Git') {
            steps {
                git branch: 'main', url: 'https://github.com/riaanlee/portfolio-site.git'
            }
        }

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                    sh '''
    export JAVA_HOME=${JAVA_HOME}
    export PATH=$JAVA_HOME/bin:$PATH
    $SCANNER_HOME/bin/sonar-scanner \
        -Dsonar.projectKey=portfolio \
        -Dsonar.projectName=portfolio-site
'''

                }
            }
        }

        stage('Quality Gate') {
            steps {
                script {
                    waitForQualityGate abortPipeline: false, credentialsId: 'Sonar-token'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('OWASP Dependency Check') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }

        stage('Trivy FS Scan') {
            steps {
                sh 'trivy fs . > trivyfs.txt'
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker', toolName: 'docker') {
                        sh "docker build -t $DOCKER_IMAGE ."
                        sh "docker push $DOCKER_IMAGE"
                    }
                }
            }
        }

        stage('Trivy Image Scan') {
            steps {
                sh "trivy image $DOCKER_IMAGE > trivyimage.txt"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    dir('Kubernetes') {
                        sh 'kubectl apply -f Kubernetes/deployment.yml'
sh 'kubectl apply -f Kubernetes/service.yml'

                    }
                }
            }
        }
    }

    post {
        always {
            emailext attachLog: true,
                subject: "'${currentBuild.result}'",
                body: "Portfolio CI/CD Pipeline<br/>" +
                      "Build: ${env.BUILD_NUMBER}<br/>" +
                      "Status: ${currentBuild.result}<br/>" +
                      "URL: ${env.BUILD_URL}",
                to: 'iambatmanthegoat@gmail.com',
                attachmentsPattern: 'trivyfs.txt,trivyimage.txt'
        }
    }
}
