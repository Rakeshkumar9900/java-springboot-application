pipeline {
    agent any
    environment {
        DOCKER_REGISTRY_URL = 'https://hub.docker.com'  // or your private registry URL
    }

    stages {
        stage('Git Checkout') {
            steps {
                
            }
        }

        stage('Build and tag docker image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker')  {
                        sh "docker build -t 98800/valentine:v1 ."
                    }
                }
            }
        }

        stage('Push docker image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker')  {
                        sh "docker push 98800/valentine:v1"
                    }
                }
            }
        }

        stage('Deploy docker container') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker')  {
                        sh "docker run -d -p 8081:80 98800/valentine:v1"
                    }
                }
            }
        }
    }
}
