pipeline {
    agent any

    environment {
        CONTAINER_NAME = "app"
        AWS_REGION = 'eu-central-1'
        ECR_REPOSITORY_URI = '089454741934.dkr.ecr.eu-central-1.amazonaws.com/dynamic_website'
        version = "${env.BUILD_ID}"
    }

    stages {
        stage('Clean Workspace') {
            steps {
                // Delete the existing directory (if it exists)
                sh 'rm -rf demo_rep'
                sh ' whoami'
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                // Stop and remove the existing container if it exists
                sh '''
                docker stop ${CONTAINER_NAME} || true
                docker rm ${CONTAINER_NAME} || true
                '''
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

        stage('Login to ECR') {
            steps {
                sh '''
                    aws ecr get-login-password --region eu-central-1 | docker login --username AWS --password-stdin 089454741934.dkr.ecr.eu-central-1.amazonaws.com
                '''
            }
        }

        stage('Tag and Push to ECR') {
            steps {
                sh '''
                docker tag app:latest ${ECR_REPOSITORY_URI}:${version}
                docker push ${ECR_REPOSITORY_URI}:${version}
                '''
            }
        }

        // stage('Run App Container') {
        //     steps {
        //         // Stop and remove the existing container if it exists
        //         sh '''
        //         docker stop ${CONTAINER_NAME} || true
        //         docker rm ${CONTAINER_NAME} || true
        //         '''

        //         // Run the Docker container from the built image
        //         sh '''
        //         docker run -d --name ${CONTAINER_NAME} -p 5000:5000 app
        //         '''
        //     }
        // }
    }
}
