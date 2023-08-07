// push v2
pipeline {
    agent any
    
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main',
                url: 'https://github.com/Roni-Angress/demo_rep.git'
    }
}

        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("app:${env.BUILD_NUMBER}")
                }
            }
        }
    }

}
