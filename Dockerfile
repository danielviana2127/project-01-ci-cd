FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY app/pom.xml .
RUN mvn dependency:go-offline
COPY app/src ./src
RUN mvn package -DskipTests

FROM eclipse-temurin:17-jre
WORKDIR /app
COPY --from=build /app/target/demo-1.0.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

