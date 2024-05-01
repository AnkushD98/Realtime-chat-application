# Use a base image with Java and Maven installed
FROM maven:3.8.3-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project's files into the container
COPY pom.xml .
COPY src ./src

# Build the application using Maven
RUN mvn clean package -DskipTests

# Create the final image using a lightweight base image
FROM openjdk:17.0.1-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file generated in the previous stage into the container
COPY --from=build /app/target/chat-app-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

# Specify the command to run your Spring Boot application when the container starts
ENTRYPOINT ["java", "-jar", "app.jar"]
