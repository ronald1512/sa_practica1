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
        echo '''docker stop $(docker ps -a -q)'''
        echo "docker build -t frontend ."
        echo "docker run -d -p 80:80 frontend"
      }
    }

  }
}