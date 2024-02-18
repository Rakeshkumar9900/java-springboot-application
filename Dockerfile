# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . .

# Install Maven
RUN apk add --no-cache maven

# Run Maven to download dependencies
RUN mvn -B dependency:go-offline

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV NAME World

# Run application when the container launches
CMD ["mvn", "spring-boot:run"]
