pipeline {
    agent any
    
    stages {
        stage('Maven Install') {
            agent {
                docker {
                    image 'maven:3.8.6-openjdk-11'
                    args '-v $HOME/.m2:/root/.m2 -v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                sh 'mvn clean install -DskipTests'
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t spring-petclinic:latest .'
                }
            }
        }
    }
}
