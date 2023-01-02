pipeline{
    agent any
    stages{
        stage("Set Variable"){
            steps{
                script {
                    IMAGE_NAME="dockertesting3"
                    IMAGE_STORAGE = "192.168.0.31:5000"
                    IMAGE_STORAGE_CREDENTIAL = "NexusCredentials"
                    IMAGE_NUM = env.BUILD_NUMBER
                }
            }
        }
        stage("Build Container Image"){
            steps{
                script{
                    image = docker.build("${IMAGE_STORAGE}/${IMAGE_NAME}:${IMAGE_NUM}")
                    image2 = docker.build("${IMAGE_STORAGE}/${IMAGE_NAME}:latest")
                }
            }
        }
        stage("Push ContainerImage"){
            steps{
                script{
                    // docker.withRegistry("https://${IMAGE_STORAGE_URL}:${IMAGE_STORAGE_PORT}", IMAGE_STORAGE_CREDENTIAL){
                    //     image.push("${env.BUILD_NUMBER}")
                    //     image.push("latest")
                    // }
                    echo 'Update Testing3'
                    sh 'docker login -u admin -p tnsqja4856 192.168.0.31:5000'
                    sh "docker push ${IMAGE_STORAGE}/${IMAGE_NAME}:${IMAGE_NUM}"
                    sh "docker push ${IMAGE_STORAGE}/${IMAGE_NAME}:latest"
                }
            }
        }
    }
}