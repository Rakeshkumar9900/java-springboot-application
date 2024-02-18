# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the Maven project files
COPY pom.xml .

# Build dependencies
RUN apk add --no-cache maven
RUN mvn -B dependency:go-offline

# Copy the application source
COPY src src

# Package the application
RUN mvn package -DskipTests

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run the application
CMD ["java", "-jar", "target/your-application-name.jar"]
