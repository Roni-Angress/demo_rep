pipeline {
    agent any

    stages {
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
                // Run the Docker container from the built image
                sh '''
                docker run -d --name app-container -p 5000:5000 app
                '''
            }
        }
    }

}
