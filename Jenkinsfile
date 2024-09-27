pipeline {

    parameters {
        booleanParam(name: 'test', defaultValue: true, description: '')
    }
    agent any

    environment{
        new_image = 2   
    }
    stages {
        

        stage("build") {
            steps {
                script {
                    echo "building stage"
                }
            }
        }

        stage('test') {
            when {
                expression {
                    params.test
                }
            }
            steps {
                script {
                    echo "test satge"
                }
            }
        }

        stage('build&push image') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'dockerhub-conn', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
                        sh "docker build -t rashadahmed424/static-web-app:${new_image} ."
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
                    def dockerCmd = "docker run -d -p 85:80 ashadahmed424/static-web-app:${new_image}"
                    sshagent(['web-server-key']) {
                        sh """    
                        ssh -o StrictHostKeyChecking=no ec2-user@35.170.182.83 "${dockerComposeCmd}"
                        "
                        """
                    }
                }
            }
        }
    }
}