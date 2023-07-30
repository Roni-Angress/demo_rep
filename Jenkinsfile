pipeline {
    agent {
        docker {
            image 'maven:3-alpine'
            // Specify any other necessary agent configuration here
        }
    }
    
    environment {
        DOCKER_IMAGE = "my-flask-app:${env.BUILD_NUMBER}"
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/Roni-Angress/demo_rep.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    try {
                        def dockerImage = docker.build(env.DOCKER_IMAGE)
                        dockerImage.push()
                    } catch (Exception e) {
                        // Handle any build failures or errors
                        // e.g., send a notification or perform a rollback
                        throw e
                    } finally {
                        // Clean up any resources if needed
                    }
                }
            }
        }
        
        stage('Run Docker Container') {
            steps {
                sh "docker run -d -p 8080:80 ${env.DOCKER_IMAGE}"
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
    }
}
