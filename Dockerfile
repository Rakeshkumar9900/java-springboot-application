# Use an official Tomcat image as a parent image
FROM tomcat:9-jdk11-openjdk-slim

# Set the working directory to /usr/local/tomcat/webapps
WORKDIR /usr/local/tomcat/webapps

# Remove the default ROOT application from Tomcat
RUN rm -rf ROOT

# Copy the WAR file into the container at /usr/local/tomcat/webapps
COPY ./target/docker-java-app-example.war .

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Run Tomcat when the container launches
CMD ["catalina.sh", "run"]
