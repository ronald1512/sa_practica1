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
    stage('Docker run'){
      steps {
        sh "docker run -d -p 80:80 romerog1512/frontend:staging"
      }
    }

  }
}