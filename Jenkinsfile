pipeline {
  agent {label 'master'}
  stages {
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
        sh "docker stop $(docker ps -a -q)"
        sh "docker build -t frontend ."
        sh "docker run -d -p 80:80 frontend"
      }
    }

  }
}