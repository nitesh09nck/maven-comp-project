FROM eclipse-temurin:17-jdk
WORKDIR /Users/niteshrathore/minikube-github-actions-project
COPY target/maven-comp-project-1.0-SNAPSHOT.jar app.jar
CMD ["java", "-jar", "app.jar"]

