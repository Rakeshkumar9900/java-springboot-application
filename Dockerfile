# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine

# set shell to bash
# source: https://stackoverflow.com/a/40944512/3128926
RUN apk update && apk add bash

# Set the working directory to /app
WORKDIR /app

# Copy the Maven build file
COPY pom.xml .

# Check if .mvn directory exists before copying
RUN test -d .mvn && cp -r .mvn ./.mvn || true

# Download dependencies only to cache them
RUN mvn -B dependency:go-offline

# Copy the rest of the application code
COPY src ./src

# Build the application
RUN mvn -B package

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the JAR file when the container launches
CMD ["java", "-jar", "target/*.jar"]
