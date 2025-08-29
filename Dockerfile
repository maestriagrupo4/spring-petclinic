


FROM openjdk:11-jre-slim

WORKDIR /app

# Copiar el JAR generado por Maven
COPY target/spring-petclinic-*.jar app.jar

# Exponer puerto
EXPOSE 8080

# Comando de inicio
CMD ["java", "-jar", "app.jar"]
