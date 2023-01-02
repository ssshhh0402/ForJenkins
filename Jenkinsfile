pipeline{
    agent any
    stages{
        stage("Set Variable"){
            steps{
                script {
                    IMAGE_NAME="dockertesting3"
                    IMAGE_STORAGE = "192.168.0.31:5000"
                    IMAGE_STORAGE_CREDENTIAL = "NexusCredentials"
                }
            }
        }
        stage("Build Container Image"){
            steps{
                script{
                    image = docker.build("${IMAGE_STORAGE}/${IMAGE_NAME}")
                }
            }
        }
        stage("Push ContainerImage"){
            steps{
                script{
                    sh "docker login -u admin -p tnsqja4856 192.168.0.31:5000"
                    sh "docker push ${image}/${env.BUILD_NUMBER}"
                    sh "docker push ${Iimage}/${latest}"
                    // docker.withRegistry("https://${IMAGE_STORAGE}", IMAGE_STORAGE_CREDENTIAL){
                    //     image.push("${env.BUILD_NUMBER}")
                    //     image.push("latest")
                    // }
                }
                // sh "docker login -u admin -p tnsqja4856 192.168.0.31:5000"
                // sh "docker push 192.168.0.31:5000/dockertesting3"

            }
        }
    }
}