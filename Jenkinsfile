pipeline {
    agent any

    environment {
        CONTAINER_NAME = "app-${BUILD_NUMBER}"
    }

    stages {
        stage('Clean Workspace') {
            steps {
                // Delete the existing directory (if it exists)
                sh 'rm -rf demo_rep'
            }
        }
        
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                sh 'git clone https://github.com/Roni-Angress/demo_rep.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                // Build Docker image from Dockerfile in the repository
                sh '''
                docker build -t app .
                '''
            }
        }

        stage('Run App Container') {
            steps {
                // Stop and remove the existing container if it exists
                sh '''
                docker stop ${CONTAINER_NAME} || true
                docker rm ${CONTAINER_NAME} || true
                '''

                // Run the Docker container from the built image
                sh '''
                docker run -d --name ${CONTAINER_NAME} -p 5000:5000 app
                '''
            }
        }
    }
    
    post {
        always {
            // Clean up by stopping and removing the container
            sh '''
            docker stop ${CONTAINER_NAME}
            docker rm ${CONTAINER_NAME}
            '''
        }
    }
}
