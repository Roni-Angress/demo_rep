pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "app:${env.BUILD_NUMBER}"
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                git clone 'https://github.com/Roni-Angress/demo_rep.git'
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
                sh "docker run -p 5000:5000 ${env.DOCKER_IMAGE}"
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
