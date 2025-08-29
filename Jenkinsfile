#!groovy
pipeline {
  agent any
  stages {
    stage('Maven Install') {
      steps {
        sh 'mvn -B clean package'
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker build -t grupo04/spring-petclinic:latest .'
      }
    }
  }
}
