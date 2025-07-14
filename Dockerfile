# Stage 1: Building the application
FROM eclipse-temurin:21-jdk AS build
WORKDIR /app
COPY gradlew gradlew.bat build.gradle settings.gradle ./
COPY gradle ./gradle
COPY src ./src
RUN chmod +x gradlew
RUN exec ./gradlew bootJar --no-daemon

# Stage 2: Creating the final image
FROM eclipse-temurin:21-jre
WORKDIR /app
COPY --from=build /app/build/libs/hyper-web-app-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
