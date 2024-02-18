# Use an official Maven runtime as a parent image
FROM maven:3.8.4-openjdk-11-slim

# Set the working directory to /app
WORKDIR /app

# Copy the project files into the container at /app
COPY . .

# Run Maven clean install to build the project
RUN mvn clean install

# Set the working directory for the application
WORKDIR /app/target

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Define environment variable
ENV NAME World

# Run the application when the container launches
CMD ["java", "-jar", "your-application-jar-name.jar"]
