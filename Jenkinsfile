pipeline{
  agent any

  environment {
    REPO='https://github.com/ssshhh0402/ForJenkins'
    DOCKER_IMAGE='jktest'
    NEXUS_REPO='211.177.182.225:5000'    
  }
  
  stages{
    stage('Clone repository'){
      steps {
        script{
          echo 'Clone Start'
          sh "git pull ${REPO}"
          echo 'Clone Finish'
        }
      }
    }
    stage('Build Docker Image'){
      steps{
        script {
          echo 'Build Start'
          sh "docker build -t ${NEXUS_REPO}/${DOCKER_IMAGE}:latest ."
          echo 'Build Finish'
        }
      }
    }
    stage('Push to Nexus'){
      steps{
        withCredentials([usernamePassword(credentialsId: 'nexus',usernameVariable:'NEXUS_ID',passwordVariable: 'NEXUS_PWD')]){
          script{
            'push Start'
            sh "docker login -u ${NEXUS_ID} -p ${NEXUS_PWD} ${NEXUS_REPO}"
            sh "docker push ${NEXUS_REPO}/${DOCKER_IMAGE}:latest"
            'push End'
          }
        }
      }
    }
    stage('clear docker'){
      steps{
        script{
          sh "docker rmi ${NEXUS_REPO}/${DOCKER_IMAGE}:latest"
        }
      }
    }
    stage('Deploy'){
      steps{
        script{
          echo 'Deploy Start'
          echo 'Deploy End'
        }
      }
    }
  }
  
  post{
    always{
      cleanWs()
    }
    success{
      echo 'Pipeline Completed'
    }
    failure{
      echo 'Pipeline failed'
    }
  }
}