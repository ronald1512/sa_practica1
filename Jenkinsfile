pipeline {
  agent {label 'master'}
  stages {
    stage('SCM Checkout'){
      steps{
        git 'https://github.com/ronald1512/sa_practica1'
      }
    }
    stage('install') {
      steps {
        sh "npm install"
      }
    }

    stage('test') {
      steps {
        sh "npm run test"
      }
    }

    stage('build') {
      steps {
        sh "docker build . -t romerog1512/frontend:latest"
      }
    }
    stage('DockerHub Push') {
        steps {
            sh "docker login -u romerog1512 -p VzntH?^T/cM.g7]"
            sh "docker push romerog1512/frontend:latest"
            sh "docker logout"
        }
    }
    stage('Docker Deploy'){
        steps{
            ansiblePlaybook credentialsId: 'dev-server', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'dev.inv', playbook: 'deploy-docker.yml'
        }
    }

  }
}