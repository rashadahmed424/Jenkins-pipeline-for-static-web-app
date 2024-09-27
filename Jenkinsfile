pipeline {

    agent any

    environment{
       def new_image = "${BUILD_NUMBER}"
    }
    
    stages {
        
        stage("build image") {
            steps {
                script {
                    sh "docker build -t rashadahmed424/static-web-app:${new_image} ."
                }
            }
        }

       

        stage('push image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-conn', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh "echo \$PASS | docker login -u \$USER --password-stdin"
                        sh "docker push rashadahmed424/static-web-app:${new_image}"
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Deploy using Docker Compose
                    def dockerCmd = "docker run -d -p 85:80 rashadahmed424/static-web-app:${new_image}"
                    def deployServer = "ec2-user@54.235.237.230"  # replace it with your ip of deployment server  
                    sshagent(['web-server-key']) {
                        sh """    
                        ssh -o StrictHostKeyChecking=no ${deployServer} "${dockerCmd}"
                        
                        """
                    }
                }
            }
        }
    }
}
