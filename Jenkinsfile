pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                url: 'https://github.com/Roni-Angress/demo_rep.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("app:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                script {
                    def dockerContainer = dockerImage.run("-p 5000:5000 -d")
                }
            }
        }
    }
    
}
