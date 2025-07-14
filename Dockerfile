# Stage 1: Building the application
FROM eclipse-temurin:21-jdk as build


# Stage 2: Creating the final image
FROM eclipse-temurin:21-jre
