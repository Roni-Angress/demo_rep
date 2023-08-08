pipeline {
    agent any

    environment {
        CONTAINER_NAME = "app-${BUILD_NUMBER}"
        prev_build_number = BUILD_NUMBER - 1
        PREVIOUS_CONTAINER_NAME = "app-${prev_build_number}"
        echo $CONTAINER_NAME
        echo $PREVIOUS_CONTAINER_NAME
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
                docker build -t ${CONTAINER_NAME} .
                '''
            }
        }

        stage('Run App Container') {
            steps {
                // Stop and remove the existing container if it exists
                sh '''
                docker stop ${PREVIOUS_CONTAINER_NAME} || true
                docker rm ${PREVIOUS_CONTAINER_NAME} || true
                '''

                // Run the Docker container from the built image
                sh '''
                docker run -d --name ${CONTAINER_NAME} -p 5000:5000 app
                '''
            }
        }
    }
}
