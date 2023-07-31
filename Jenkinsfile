//this is a commit test
pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = "app:${env.BUILD_NUMBER}-${commit_id}"
    }
    
    stages {
        stage('Build Docker image') {
            steps {
                script {
                    // def commit_id = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    // DOCKER_IMAGE = "app:${env.BUILD_NUMBER}-${commit_id}"
                }
                sh "docker --version"

                // sh "docker build -t $DOCKER_IMAGE ."
            }
        }
        // Add more stages as needed
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
        
//         stage('Clone Repository') {
//             steps {
//                 script {
//                     git 'https://github.com/Roni-Angress/demo_rep.git'
//                 }
//             }

        
//         stage('Build Docker Image') {
//             steps {
//                 script {
//                     try {
//                         def dockerImage
//                         if (isUnix()) {
//                             dockerImage = docker.build(env.DOCKER_IMAGE)
//                         } else {
//                             dockerImage = docker.build(env.DOCKER_IMAGE).inside('-v /var/run/docker.sock:/var/run/docker.sock') {
//                                 return docker.build(env.DOCKER_IMAGE)
//                             }
//                         }
//                         dockerImage.push()
//                     } catch (Exception e) {
//                         // Handle any build failures or errors
//                         // e.g., send a notification or perform a rollback
//                         throw e
//                     } finally {
//                         // Clean up any resources if needed
//                     }
//                 }
//             }
//         }
        
//         stage('Run Docker Container') {
//             steps {
//                 script {
//                     if (isUnix()) {
//                         sh "docker run -p 5000:5000 ${env.DOCKER_IMAGE}"
//                     } else {
//                         bat "docker run -p 5000:5000 ${env.DOCKER_IMAGE}"
//                     }
//                 }
//             }
//         }
//     }
    
//     post {
//         success {
//             echo "Pipeline succeeded!"
//         }
        
//         failure {
//             echo "Pipeline failed!"
//         }
//     }
