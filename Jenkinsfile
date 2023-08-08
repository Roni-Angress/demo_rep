pipeline {
    agent any

    environment {
        CONTAINER_NAME = "app-${BUILD_NUMBER}"
        PREVIOUS_CONTAINER_NAME = "app-${BUILD_NUMBER - 1}"
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
                script {
                    // Set the CONTAINER_NAME variable for this stage
                    withEnv(['CONTAINER_NAME=${CONTAINER_NAME}']) {
                        // Build Docker image from Dockerfile in the repository
                        sh '''
                        docker build -t ${CONTAINER_NAME} .
                        '''
                    }
                }
            }
        }

        stage('Run App Container') {
            steps {
                script {
                    // Stop and remove the container associated with the previous build
                    withEnv(['PREVIOUS_CONTAINER_NAME=${PREVIOUS_CONTAINER_NAME}']) {
                        sh '''
                        docker stop ${PREVIOUS_CONTAINER_NAME} || true
                        docker rm ${PREVIOUS_CONTAINER_NAME} || true
                        '''
                    }

                    // Run the Docker container from the built image
                    sh '''
                    docker run -d --name ${CONTAINER_NAME} -p 5000:5000 app
                    '''
                }
            }
        }
    }
}
