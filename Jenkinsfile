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
                // Build Docker image from Dockerfile in the repository
                script {
                    def imageName = 'app'
                    def dockerfileDir = '.'
                    def dockerBuildContext = '.'
                    
                    docker.build(imageName, 
                                 context: dockerBuildContext, 
                                 dockerfile: dockerfileDir + '/Dockerfile')
                }
            }
        }
    }
    

}
