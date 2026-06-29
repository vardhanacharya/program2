FROM eclipse-temurin:17

COPY target/java-cicd-app-1.0.jar app.jar

CMD ["java", "-jar", "app.jar"]
