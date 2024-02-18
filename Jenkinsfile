pipeline {
    agent any
    environment {
        DOCKER_REGISTRY_URL = 'https://hub.docker.com'  // or your private registry URL
    }

    stages {
        stage('Git Checkout') {
            steps {
               git credentialsId: 'git-token', url: 'https://github.com/Rakeshkumar9900/java-springboot-application.git' 
            }
        }

        stage('Build and tag docker image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker')  {
                        sh "docker build -t 98800/docker-java-app-example:latest ."
                    }
                }
            }
        }

        stage('Push docker image') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker')  {
                        sh "docker push 98800/docker-java-app-example:latest"
                    }
                }
            }
        }

        stage('Deploy docker container') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker')  {
                        sh "docker run -d -p 8081:80 98800/docker-java-app-example:latest"
                    }
                }
            }
        }
    }
}
