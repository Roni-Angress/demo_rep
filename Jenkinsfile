pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Roni-Angress/demo_rep.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerImage = docker.build("my-flask-app:${env.BUILD_NUMBER}")
                    dockerImage.push()
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 8080:80 my-flask-app:${env.BUILD_NUMBER}'
            }
        }
    }
    
    post {
        success {
            echo "Pipeline succeeded!"
        }
        
        failure {
            echo "Pipeline failed!"
        }
        
        always {
            cleanWs()
        }
    }
}
