pipeline{
    agent any
    stages{
        stage("Set Variable"){
            steps{
                script {
                    IMAGE_NAME="dockertesting3"
                    IMAGE_STORAGE_URL = "192.168.0.31"
                    IMAGE_STORAGE_PORT = "5000"
                    IMAGE_STORAGE_CREDENTIAL = "NexusCredentials"
                }
            }
        }
        stage("Build Container Image"){
            steps{
                script{
                    image = docker.build("${IMAGE_STORAGE_URL}:${IMAGE_STORAGE_PORT}/${IMAGE_NAME}")
                }
            }
        }
        stage("Push ContainerImage"){
            steps{
                script{
                    docker.withRegistry("https://${IMAGE_STORAGE_URL}:${IMAGE_STORAGE_PORT}", IMAGE_STORAGE_CREDENTIAL){
                        image.push("${env.BUILD_NUMBER}")
                        image.push("latest")
                    }
                }
            }
        }
    }
}