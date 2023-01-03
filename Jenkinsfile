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
        stage("TEST"){
            steps{
                script{
                    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'NexusCredentials',usernameVariable:'USERNAME', passwordVariable:'PASSWORD']]){
                        echo "My Nexus Id : ${USERNAME}, PWD : ${PASSWORD}"
                    }
                }
            }
        }
        // stage("Build Container Image"){
        //     steps{
        //         script{
        //             sh "docker build -t ${IMAGE_STORAGE}/${IMAGE_NAME}:${IMAGE_NUM} ."
        //             sh "docker build -t ${IMAGE_STORAGE}/${IMAGE_NAME}:latest ."
        //         }
        //     }
        // }
        // stage("Push ContainerImage"){
        //     steps{
        //         script{
        //             echo "${IMAGE_STORAGE_CREDENTIAL_USERNAME}"
        //             echo "${IMAGE_STORAGE_CREDENTIAL_PASSWORD}"
        //             sh "docker login -u admin -p tnsqja4856 ${IMAGE_STORAGE}"
        //             sh "docker push ${IMAGE_STORAGE}/${IMAGE_NAME}:${IMAGE_NUM}"
        //             sh "docker push ${IMAGE_STORAGE}/${IMAGE_NAME}:latest"
        //         }
        //     }
        // }
        // stage("clear docker"){
        //     steps{
        //         script{
        //             sh "docker rmi ${IMAGE_STORAGE}/${IMAGE_NAME}:${IMAGE_NUM}"
        //             sh "docker rmi ${IMAGE_STORAGE}/${IMAGE_NAME}:latest"
        //         }
        //     }
        // }
    }
}