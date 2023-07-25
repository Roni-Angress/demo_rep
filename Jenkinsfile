pipeline {
    agent any

    triggers {
        githubPush()
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
                    def dockerImage = docker.build("app:${env.BUILD_NUMBER}", "-f Dockerfile .")
                    dockerImage.push()
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
        
        always {
            cleanWs()
        }

    // Enable GitHub webhook to trigger the pipeline on code changes
    
    }
}
