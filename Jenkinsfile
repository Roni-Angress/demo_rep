pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Clone the repository from GitHub
                git clone 'https://github.com/Roni-Angress/demo_rep.git'
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

        stage('Run App Container') {
            steps {
                // Run the Docker container from the built image
                script {
                    def containerName = 'app-container'
                    def imageName = 'app'
                    
                    docker.image(imageName).run('--name ' + containerName + ' -p 5000:5000 -d')
                }
            }
        }
    }
    
}
