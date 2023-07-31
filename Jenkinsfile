pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "app:${env.BUILD_NUMBER}-${commit_id}"
    }
    
    stages {
        stage('Build Docker image') {
            steps {
                sh "docker --version"

                // sh "docker build -t $DOCKER_IMAGE ."
            }
        }
        // Add more stages as needed
    }
    
    post {
        success {
            echo "Pipeline succeeded!"
        }
        
        failure {
            echo "Pipeline failed!"
        }
    }
}
