pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build with Maven') {
            steps {
                script {
                    // Usar Maven directo sin contenedor Docker
                    sh '''
                        # Verificar si Maven está instalado
                        if command -v mvn &> /dev/null; then
                            echo "Usando Maven del sistema"
                            mvn clean package -DskipTests
                        else
                            echo "Maven no encontrado, usando Docker"
                            docker run --rm -v $(pwd):/app -w /app maven:3.8.6-openjdk-11 mvn clean package -DskipTests
                        fi
                    '''
                }
            }
        }
        
        stage('Docker Build') {
            steps {
                script {
                    def image = docker.build("spring-petclinic:${BUILD_NUMBER}")
                    image.tag('latest')
                }
            }
        }
        
        stage('Deploy') {
            steps {
                sh '''
                    docker stop spring-petclinic || true
                    docker rm spring-petclinic || true
                    docker run -d --name spring-petclinic -p 8080:8080 spring-petclinic:latest
                    echo "Aplicación desplegada en http://localhost:8080"
                '''
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
        success {
            echo '✅ ¡Despliegue exitoso!'
        }
    }
}
