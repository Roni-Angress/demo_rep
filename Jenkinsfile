pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                git clone 'https://github.com/Roni-Angress/demo_rep.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("app:${env.BUILD_NUMBER}")
                }
            }
        }
    }
    
    post {
        success {
            stage('Run Docker Container') {
                steps {
                    sh 'docker run -d -p 5000:5000 app:${env.BUILD_NUMBER}'
                }
            }
        }
    }
}
