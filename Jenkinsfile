pipeline {
    agent {
        docker {
            image 'python:3.9-slim'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t myapp .'
            }
        }
        stage('Test') {
            steps {
                sh 'docker run --rm myapp python -m unittest discover'
            }
        }
        stage('Deploy') {
            steps {
                sh 'docker run -d -p 8080:5000 --name myapp-container myapp'
            }
        }
    }
}
